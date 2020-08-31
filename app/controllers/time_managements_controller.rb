class TimeManagementsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def create
    data = params.keys[0]
    border = data.index(',')
    date = data.slice(0, border)
    length = data.length
    time = data.slice(border + 1, length - 1).to_i
    user_id = params[:user_id]
    if TimeManagement.exists?(date: date, user_id: user_id)
      time_management = TimeManagement.where(date: date, user_id: user_id)
      original_time = time_management[0][:time]
      addition_time = time + original_time
      time_management.update(time: addition_time)
    else
      TimeManagement.create(date: date, time: time, user_id: user_id)
    end
  end
end
