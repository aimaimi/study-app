class TimeManagementsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def create
    time = params.keys[0]
    user_id = params[:user_id]
    TimeManagement.create(time: time, user_id: user_id)
  end
end
