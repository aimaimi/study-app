class TimeManagementsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def create
    data = params.keys[0]
    border = data.index(",")
    date = data.slice(0,border)
    length = data.length
    time = data.slice(border + 1,length - 1)
    user_id = params[:user_id]
    TimeManagement.create(date: date, time: time, user_id: user_id)
  end
end
