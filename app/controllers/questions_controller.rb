class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.valid?
      @question.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:problem_statement, :correct_answer).merge(user_id: current_user.id)
  end
end
