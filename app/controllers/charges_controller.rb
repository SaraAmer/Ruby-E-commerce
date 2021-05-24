class ChargesController < ApplicationController

  def create
  # Amount in cents
  
  @product=Product

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: current_user.customer.id,
    
    description: 'Product Perchase',
    currency: 'usd',
  })

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root
end

end