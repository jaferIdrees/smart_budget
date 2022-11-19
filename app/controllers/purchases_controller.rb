class PurchasesController < ApplicationController

    def index
        @purchases = Group.find(params[:format]).purchases
    end
    def new
        @purchase = Purchase.new
        @groups = current_user.groups
    end
    def create
        purchase = Purchase.new(author: current_user, name: params[:purchase][:name], amount: params[:purchase][:amount])
        groups = [Group.find(params[:purchase][:groups])]
        if purchase.save
            purchase.groups = groups
        end
        
    end
end
