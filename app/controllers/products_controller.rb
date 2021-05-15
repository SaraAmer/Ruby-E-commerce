class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:name, :store_id, :category_id, :price, :rate, :quantity)
    end

end
