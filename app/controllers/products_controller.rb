class ProductsController < InheritedResources::Base
  before_action do
    @categories=Category.all   
    @brands=Brand.all
    @store=Store.all
end
  before_action :authenticate_user!
  def index
    @cart_products = current_user.cart.products
  
    if params[:store_id] 
      @store = Store.find(params[:store_id])
      @products = Product.where(store_id: params[:store_id])   
    else     
      @products = Product.all
    end  
  end
  def show
    @product = Product.find(params[:id])
    # @products = Product.find(1)
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




  
def create 
    @product= Product.new(product_params)
 
    if @product.save
      redirect_to @product
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
 def add_to_cart
 end
 def delete_from_cart
  @product = Product.find(params[:id])
  @cart = Cart.find_by(user: current_user)
  @cart.products.delete(@product)
  
  

 end

########################################
def search
  ##goz2 al search
  if params[:s]== "" and  params[:category]== "All"  and  params[:price]== "All" and params[:seller]== "All"
     redirect_to :controller => 'products', :action => 'index'
  end
  if params[:s] != ""
    if params[:category]== "All"  and  params[:price]== "All" and params[:seller]== "All"
      @products=Product.where("name LIKE ?","%"+params[:s]+"%")
      # puts "heeeeeeeeeeeeeeeeeeeeeeeeere+#{@products.inspect}"
    end
  end
  ##goz2 al filter
  #####################################################
  if params[:category] == "All" and params[:brand] != "All" and params[:price] == "All" and params[:seller] == "All"
    @productBrand=Product.where(brand_id: params[:brand])
    puts "########################################################+#{@productBrand.inspect} "
  end
  #########################Done#########################
  if params[:category] != "All" and params[:brand] == "All" and params[:price] == "All" and params[:seller] == "All"
    @productCategory=Product.where(category_id: params[:category])
  end
  ########################Done###########################
  if params[:category] == "All" and params[:brand] == "All" and params[:price] == "All" and params[:seller]  != "All"
    @productSellers=Product.where(store_id: params[:seller])
  end
  #######################Done############################
  if params[:category] == "All" and params[:brand] == "All" and params[:price] != "All" and params[:seller]  == "All"
    if params[:price] == "0..9"
    @productPrice=Product.where(price: 0..9)
    elsif params[:price] == "10..20"
    @productPrice=Product.where(price: 10..20)
    elsif params[:price] == "20"
    @productPrice=Product.where("price > ?", 20)
    end

  end
  ##################################################
  if params[:category] == "All" and params[:brand] != "All" and params[:price] == "All" and params[:seller] == "All"
    @productBrand=Product.where(brand_id: params[:brand])
    puts "########################################################+#{@productBrand.inspect} "

  end
  ###########################Done########################
  # if params[:category] == "All" #All da al default 
  #    if params[:brand] != "All"  #lw atktb 7aga fe al brands
  #     if  params[:price] == "All"  #lw m5trsh  7aga
  #       if  params[:seller] == "All" ##da al default
  #         #l2an bytb3t name w ana m7taga fe gdwl al product a3ml search bal brand_id
  #         # brand=Brand.find_by(name: params[:brand])
  #         # puts "heeeeeeeeeeeeeeeeeeeeeeeeere+#{brand.inspect}"
  #         # brand_id=Brand.where(:name => params[:brand]).pluck(:id).first
  #         puts "########################################################3"
  #         @productBrand=Product.where(brand_id: params[:brand])
  #         puts "########################################################+#{@productBrand.inspect} "

  #       end
  #     end
  #    end
  # end
  ############################Done#############################
  if params[:category] == "All" #lw m5trsh 7aga 
    if params[:brands] != "All" #lw a5tar brand
     if  params[:price] == "All" 
       if  params[:seller] != "All" #lw a5tar seller
        ###da bygeb al products 2li al store bta3ha kza 
        #########################balnsba ll brands hal dmg w y3rd al atnen
        ###########73mlha y3rd al atnen mynf3sh lazm dmg 3lshan kda nfs al product 7yt3rd mrtan
        ####, in where means and   
        @productSellerbrand=Product.where(store_id: params[:seller],brand_id: params[:brand])
        # @productSellerbrand2=Product.where(brand_id: params[:brand])
       end
     end
    end
  end
################################################################
if params[:category] == "All"
  if params[:brands] != "All" #lw a5tar brand
   if  params[:price] != "All" #lw a5tar price
     if  params[:seller] == "All"
          #  @productCategory=Product.where(brand_id: params[:brand],price: params[:price] )
     end
   end
  end
end
###############################################################
if params[:category] == "All"
if params[:brands] != "All"   #lw a5tar brand
 if  params[:price] != "All"  #lw a5tar price
   if  params[:seller] != "All" #lw a5tar seller
         # @productCategory=Product.where(category: params[:category])
   end
 end
end
end
#################################################################
end
#############################
def add_to_cart
end
################
    private
    def product_params
      params.require(:product).permit(:name, :category_id, :price, :rate, :quantity ,:brand_id, :description,images: [] )
    end

end
