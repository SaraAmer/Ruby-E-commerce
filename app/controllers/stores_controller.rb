class StoresController < ApplicationController
    def show
        @store = Store.find(params[:id])
    end
    
    def products 
        # @products = Product.where(store: )
    end
end
