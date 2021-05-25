class ProductsController < InheritedResources::Base
 # before_action :authenticate_user!
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
      render 'new'
    end
  end
  
  def destroy
  @product = Product.with_attached_images.find(params[:id])
  @store = Store.find(params[:store_id])
  @product.images.purge
  @product.destroy
  redirect_to store_products_path(@store)
  
  end 
  def edit 
    
    @store = Store.find(params[:store_id])
    @product = Product.with_attached_images.find(params[:id])
    
    end
  def update
        @store = Store.find(params[:store_id])

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
 
 
 def home 
  @cart = Cart.find_or_create_by(user: current_user)
 
  @cart_products = @cart.products
 
 
  if params[:category] != "All" 
    @productCategories=Product.where(category_id: params[:category])
    @productCategory= @productCategories.all.order("created_at ASC").where("created_at >= ?", Time.now-2.days)
  else
    @productCategory = Product.all.order("created_at ASC").where("created_at >= ?", Time.now-2.days)

    end
 
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
  quantity = @cart_product.quantity
  if @product.quantity > @cart_product.quantity && params[:type] == "plus" 
   quantity = @cart_product.quantity+1
  elsif @cart_product.quantity > 1 && params[:type] == "minus"
   quantity = @cart_product.quantity-1
  end
  puts "==========================================="
  puts params[:type]
  puts "==========================================="
  @cart_product.update(quantity: quantity)
  redirect_to request.referrer
  end

   
  ########################################
def search
  @cart = Cart.find_or_create_by(user: current_user)
  @cart_products = @cart.products
  if params[:s] == "" 
    redirect_to :controller => 'products', :action => 'index'
 end

 if params[:s] != ""
     @products=Product.where("name LIKE ?","%"+params[:s]+"%").or (Product.where("description LIKE ?","%"+params[:s]+"%"))
 end
end
 
def filter
  @cart = Cart.find_or_create_by(user: current_user)
  @cart_products = @cart.products
 
  ##goz2 al filter
  if params[:category] == "All" and params[:brand] == "All" and params[:price] == "All" and params[:seller] == "All"
    redirect_to :controller => 'products', :action => 'index'
  end
  #####################################################
  if params[:category] == "All" and params[:brand] != "All" and params[:price] == "All" and params[:seller] == "All"
    @products=Product.where(brand_id: params[:brand])
    puts "########################################################+#{@productBrand.inspect} "
  end
  #########################Done#########################

  if params[:category] != "All" and params[:brand] == "All" and params[:price] == "All" and params[:seller] == "All"
    @productsCategory=Product.where(category_id: params[:category])
    puts "########################################################+#{@products.inspect}"

  end
  ########################Done###########################
  if params[:category] == "All" and params[:brand] == "All" and params[:price] == "All" and params[:seller]  != "All"
    @productsseller=Product.where(store_id: params[:seller])
    puts "########################################################+#{@products.inspect}"
  end
  #######################Done############################
  if params[:category] == "All" and params[:brand] == "All" and params[:price] != "All" and params[:seller]  == "All"
    if params[:price] == "0..9"
      @products=Product.where(price: 0..9)
    elsif params[:price] == "10..20"
      @products=Product.where(price: 10..20)
    elsif params[:price] == "20"
      @products=Product.where("price > ?", 20)
    end

  end
  ##################################################
  if params[:category] == "All" and params[:brand] != "All" and params[:price] == "All" and params[:seller] == "All"
    @products=Product.where(brand_id: params[:brand])
    puts "########################################################+#{@productBrand.inspect} "

  end
 ############################6-Done#############################
  #lw m5trsh 7aga  #lw a5tar brand #lw a5tar seller
  if params[:category] == "All" and params[:brands] != "All" and params[:price] == "All" and params[:seller] != "All"   
    ###da bygeb al products 2li al store bta3ha kza 
    #############balnsba ll brands hal dmg w y3rd al atnen 73mlha y3rd al atnen mynf3sh lazm dmg 3lshan kda nfs al product 7yt3rd mrtan , in where means and 
    @products=Product.where(store_id: params[:seller],brand_id: params[:brand])
end
##########################7-Done######################################
if params[:category] == "All"
if params[:brands] != "All" #lw a5tar brand
if  params[:price] != "All" #lw a5tar price
 if  params[:seller] == "All"
  if params[:price] == "0..9"
    @products=Product.where(price: 0..9,brand_id: params[:brand]) 
    elsif params[:price] == "10..20"
      @products=Product.where(price: 10..20,brand_id: params[:brand]) 
  elsif params[:price] == "10..20"
    elsif params[:price] == "20"
      @products=Product.where("price > 20",brand_id: params[:brand]) 
  elsif params[:price] == "10..20"
    end
end
end
end
end
############################8-Done###################################
#lw a5tar brand#lw a5tar price#lw a5tar seller
if params[:category] == "All" and params[:brands] != "All" and  params[:price] != "All"and params[:seller] != "All"
if params[:price] == "0..9"
  @products=Product.where(price: 0..9,brand_id: params[:brand],store_id: params[:seller])
  elsif params[:price] == "10..20"
    @products=Product.where(price: 10..20,brand_id: params[:brand],store_id: params[:seller])
  elsif params[:price] == "20"
    @products=Product.where("price > 20",brand_id: params[:brand],store_id: params[:seller])
end
# puts "########################################################+#{@productPrice.inspect} "

end
############################9-Done#############################
if params[:category] != "All" and params[:brands] != "All" and params[:price] == "All" and params[:seller] == "All"       
  @products=Product.where(category_id: params[:category],brand_id: params[:brand])
end
#############################10-Done#############################################
if params[:category] == "All" and params[:brands] != "All" and  params[:price] != "All"and params[:seller] != "All"
if params[:price] == "0..9"
  @products=Product.where(price: 0..9,brand_id: params[:brand],store_id: params[:seller])
elsif params[:price] == "10..20"
  @products=Product.where(price: 10..20,brand_id: params[:brand],store_id: params[:seller])
elsif params[:price] == "20"
  @products=Product.where("price > 20",brand_id: params[:brand],store_id: params[:seller])
end
# puts "########################################################+#{@productPrice.inspect} "
end
######################################################################
if params[:category] != "All"
if  params[:brands] == "All" 
 if params[:price] != "All"
   if params[:seller] == "All" 
      if params[:price] == "0..9"
        @productspricecategoy=Product.where(price: 0..9)
        elsif params[:price] == "10..20"
          @productspricecategoy=Product.where(price: 10..20,category_id: params[:category])
        elsif params[:price] == "20"
          @productspricecategoy=Product.where("price > 20",category_id: params[:category])
      end
     end
  end
end
puts "########################################################+#{@products.inspect} "
end
############################Check-category-Seller#####################################
if params[:category] != "All" and params[:brands] == "All" and  params[:price] == "All"and params[:seller] != "All"
  puts params[:category]
  puts params[:seller]
  @productCategoryseller=Product.where(store_id: params[:seller],category_id: params[:category])
  puts "########################################################+#{@productCategoryseller.inspect} "
end
  #########################Category-brand-seller##################
  if params[:category] != "All" and params[:brands] != "All" and  params[:price] == "All"and params[:seller] != "All"
    puts params[:category]
    puts params[:seller]
    @productCategoryseller=Product.where(store_id: params[:seller],category_id: params[:category],brand_id: params[:brand])
    puts "########################################################+#{@productCategoryseller.inspect} "
  end
  ##########################Check-Category-brand-price################################
  if params[:category] != "All" and params[:brands] != "All" and  params[:price] != "All"and params[:seller] != "All"
    if params[:price] == "0..9"
      @productbrandPrice=Product.where(price: 0..9,brand_id: params[:brand],store_id: params[:seller],category_id: params[:category])
    elsif params[:price] == "10..20"
      @productbrandPrice=Product.where(price: 10..20,brand_id: params[:brand],store_id: params[:seller],category_id: params[:category])
    elsif params[:price] == "20"
      @productbrandPrice=Product.where("price > 20",brand_id: params[:brand],store_id: params[:seller],category_id: params[:category])
    end
    # puts "########################################################+#{@productPrice.inspect} "
    end
  ##################################Category-price-seller###########################
  if params[:category] != "All" and params[:brands] == "All" and  params[:price] != "All"and params[:seller] != "All"
    if params[:price] == "0..9"
      @productbrandPrice=Product.where(price: 0..9,store_id: params[:seller],category_id: params[:category])
    elsif params[:price] == "10..20"
      @productbrandPrice=Product.where(price: 10..20,store_id: params[:seller],category_id: params[:category])
    elsif params[:price] == "20"
      @productbrandPrice=Product.where("price > 20",store_id: params[:seller],category_id: params[:category])
    end
    # puts "########################################################+#{@productPrice.inspect} "
    end
  ###################################Category-Seller-brand-price##################################
  if params[:category] != "All" and params[:brands] != "All" and  params[:price] != "All"and params[:seller] != "All"
    if params[:price] == "0..9"
      @productbrandPrice=Product.where(price: 0..9,store_id: params[:seller],brand_id: params[:brand],category_id: params[:category])
    elsif params[:price] == "10..20"
      @productbrandPrice=Product.where(price: 10..20,store_id: params[:seller],brand_id: params[:brand],category_id: params[:category])
    elsif params[:price] == "20"
      @productbrandPrice=Product.where("price > 20",store_id: params[:seller],brand_id: params[:brand],category_id: params[:category])
    end
    # puts "########################################################+#{@productPrice.inspect} "
    end


  ##################################################################
end

  private
  def product_params
  params.require(:product).permit(:name, :category_id, :price, :rate, :quantity ,:brand_id, :description,images: [] )
  end
  
end 
