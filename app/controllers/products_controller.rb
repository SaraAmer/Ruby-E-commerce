class ProductsController < InheritedResources::Base
 
  def index
    @products = Product.all

   
  end

  
    def show
      @product = Product.find(params[:id])
    end

  def create 
    @product= Product.new(product_params)
 
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end
    private
    def product_params
      params.require(:product).permit(:name, :store_id, :category_id, :price, :rate, :quantity ,:brand_id, images: [])
    end

end
