class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  
    def show
      @products = Product.find(params[:id])
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:categoryname, :brandname)
    end
end
