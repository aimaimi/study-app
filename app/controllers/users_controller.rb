class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.search(params[:keyword]).all.order('created_at DESC')
  end
end
