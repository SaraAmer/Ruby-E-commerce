class ProductsController < InheritedResources::Base
  before_action :authenticate_user!
  def index
    if params[:store_id] 
      @store = Store.find(params[:store_id])
      @products = Product.where(store_id: params[:store_id])
      @owner = true 
    else     
      @products = Product.all
      @owner = false 
    end  
  end
  def storeProducts
    Product.where(store_id: params[:store_id])
  end
  def new
    @store = Store.find(params[:store_id])
  end
  
    def show
      @product = Product.with_attached_images.find(params[:id])
    end
   def edit 
  
    @store = Store.find(params[:store_id])
    puts "helllllllllllllllllllllllllo"
    @product = @store.products.find(params[:id])
   
   end
  def create 
    @store = Store.find(params[:store_id])
    @product=  @store.products.create(product_params)
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.create(comment_params)
    # redirect_to article_path(@article)
    if @product.save
      redirect_to store_product_path(@store,@product)
    else
      render 'new'
    end
  end
    private
    def product_params
      params.require(:product).permit(:name, :category_id, :price, :rate, :quantity ,:brand_id, images: [])
    end

end
