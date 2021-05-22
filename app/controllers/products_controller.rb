class ProductsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action do
    @categories=Category.all 
    @brands=Brand.all
    @stores=Store.all
   end
  def index
    @cart = Cart.find_or_create_by(user: current_user)
    @cart_products = @cart.products
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
  end
  def create 
    @store = Store.find(params[:store_id])
    @product=  @store.products.create(product_params)

    if @product.save
      redirect_to store_product_path(@store,@product)
    else  
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

  @image = ActiveStorage::Blob.find(params[:id])
  @image.purge
  @store = Store.find(params[:store_id])
 redirect_to  new_store_product_path
 end

 def add_to_cart
 end
 def delete_from_cart
  @product = Product.find(params[:id])
  @cart = Cart.find_by(user: current_user)
  @cart.products.delete(@product)
  redirect_to request.referrer
 end
def update_cart_quantity
@product = Product.find(params[:id])
@cart = Cart.find_by(user: current_user)
@cart_product = CartsProduct.find_by(cart: @cart , product: @product)

if params[:type] == "plus" 
  quantity = @cart_product.quantity+1
else params[:type] == "minus"
  quantity = @cart_product.quantity-1
end
puts "==========================================="
puts params[:type]
puts "==========================================="
@cart_product.update(quantity: quantity)
redirect_to request.referrer



end
    private
    def product_params
      params.require(:product).permit(:name, :category_id, :price, :rate, :quantity ,:brand_id, :description,images: [] )
    end

end
