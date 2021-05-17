class StoresController < ApplicationController
    def show
        @store = Store.find(params[:id])
    end
end
