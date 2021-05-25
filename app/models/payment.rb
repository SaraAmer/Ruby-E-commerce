class Payment < ActiveRecord::Base

    attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
    
    belongs_to :user
    
    def self.month_options
    
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{name}", i+1]}
    
    end
    
    def self.year_options
    
    (Date.today.year..(Date.today.year+10)).to_a
    
    end
    
    def process_payment
        @cart = Cart.find_or_create_by(user: current_user)
        @cart_total = CartsProduct.all
        @products = @cart.products
        @total = 0 ; 
        @products.each do |product|
        @total+= product.carts_products[0].quantity*product.price
        end
      # Amount in cents
      @amount = @total.to_i
    
    customer = Stripe::Customer.create email: email, card: token
    
    Stripe::Charge.create customer: customer.id,
    
    amount: @amount,
    
    description: 'Premium',
    
    currency: 'usd'
    
    end
    
end