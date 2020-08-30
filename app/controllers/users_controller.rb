class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @times = @user.time_managements.where(user_id: @user.id)
  end

  def search
    @users = User.search(params[:keyword]).all.order('created_at DESC')
  end
end
