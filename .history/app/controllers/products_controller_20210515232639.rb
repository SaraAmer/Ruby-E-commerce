class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  
    def show
      @products = Product.find(params[:id])
    end
    private
  
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:categoryname, :brandname,:name,:rate)
    end
end
