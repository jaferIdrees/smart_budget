class GroupsController < ApplicationController
  def index
    @groups = Group.where(author: current_user)
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(author: current_user, name: params[:group][:name], icon: params[:group][:icon])
    if group.save
      redirect_to groups_path, notice: 'Group added successsfuly'
    else
      redirect_to groups_path, notice: 'Group not saved'
    end
  end

  def show
    redirect_to purchases_path(params[:id])
  end
end
