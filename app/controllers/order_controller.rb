class OrderController < ApplicationController
    def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
      end
    
      def new
        @order = Order.new
      end
    end
    