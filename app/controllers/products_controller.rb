class ProductsController < InheritedResources::Base
  before_action :authenticate_user!
  def index
    if params[:store_id] 
      @store = Store.find(params[:store_id])
      @products = Product.where(store_id: params[:store_id])   
    else     
      @products = Product.all
    end  
  end
  def storeProducts
    Product.where(store_id: params[:store_id])
  end


  def new
    @store = Store.find(params[:store_id])
    @product = Product.new
   
    #@categories_array = Category.all.map{|category|[category.name , category.id]}
    
  end
  def create 
    @store = Store.find(params[:store_id])
    @product=  @store.products.create(product_params)

    if @product.save
      redirect_to store_product_path(@store,@product)
    else
     # @categories_array = Category.all.map{|category|[category.name , category.id]}
 
      
      render 'new'
    end
  end
    def show
      @product = Product.with_attached_images.find(params[:id])
    end

   def edit 
    @store = Store.find(params[:store_id])
    @product = Product.with_attached_images.find(params[:id])

   end
  def destroy
    @product = Product.with_attached_images.find(params[:id])
    @store = Store.find(params[:store_id])
    @product.images.purge
    @product.destroy
    redirect_to store_products_path(@store)

  end 
  def update
    @product = Product.with_attached_images.find(params[:id])
    if @product.update(product_params)
      render 'show'
    else
      render 'edit'
    end
  end
 def delete_attachment
  puts "gelllllllllllllllllllllllllllllllllllllo"
  @image = ActiveStorage::Blob.find(params[:id])
  puts "======================================"
  puts params[:id]
  puts "======================================"
  @image.purge
  @store = Store.find(params[:store_id])
 
 redirect_to  new_store_product_path
 end
 def home 
  @products = Product.all.order("created_at ASC").where("created_at >= ?", Time.now-1.days)
  @categories=Category.all
 end

 def add_to_cart
 end

    private
    def product_params
      params.require(:product).permit(:name, :category_id, :price, :rate, :quantity ,:brand_id, :description,images: [] )
    end

end
