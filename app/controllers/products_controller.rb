class ProductsController < InheritedResources::Base
 
  def index
    @products = Product.all

   
  end

  
    def show
      @products = Product.find(params[:id])
    end

  
    private
    def product_params
      params.require(:product).permit(:name, :store_id, :category_id, :price, :rate, :quantity)
    end

end
