class PurchasesController < ApplicationController

    def index
        @group = Group.find(params[:format])
        @purchases = @group.purchases
        @total_amount =  @group.total_amount
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
            groups[0].total_amount += purchase.amount
            groups[0].save!
        end
        
    end
end
