class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC').page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @times = @user.time_managements.where(user_id: @user.id).page(params[:page]).per(10)
    @graph = []
    @times.each do |time|
      @graph << [time.date, time.time / 60]
    end
  end

  def search
    @users = User.search(params[:keyword]).all.order('created_at DESC').page(params[:page]).per(20)
  end
end
