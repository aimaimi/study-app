class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    @user = User.find(params[:user_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @user = User.find(params[:user_id])
    @answer = Answer.new(answer_params)
    if @answer.valid?
      @answer.save
      redirect_to user_questions_path(@user.id, @question.id)
    else
      render :new
    end
  end

  private

  def answer_params
    params.permit(:answer, :feedback_id, :question_id).merge(user_id: current_user.id)
  end
end
