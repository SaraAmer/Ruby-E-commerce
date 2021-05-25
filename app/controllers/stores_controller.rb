class StoresController < ApplicationController
    def show
        @store = Store.find(params[:id])
        redirect_to store_products_path(@store)
    end
    
    def products 
        # @products = Product.where(store: )
    end
end
