class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.valid?
      @answer.save
      redirect_to questions_path
    else
      @question = Question.find(params[:question_id])
      render :new
    end
  end

  private

  def answer_params
    params.permit(:answer, :feedback_id, :question_id).merge(user_id: current_user.id)
  end
end
