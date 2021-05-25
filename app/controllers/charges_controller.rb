class ChargesController < ApplicationController


  def create
    @cart = Cart.find_or_create_by(user: current_user)
    @cart_total = CartsProduct.all
    @products = @cart.products
    @total = 0 ; 
    @products.each do |product|
    @total+= product.carts_products[0].quantity*product.price
    end
  # Amount in cents
  @amount = @total.to_i
  @product=Product

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Product Perchase',
    currency: 'usd',
  })

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root
end

end