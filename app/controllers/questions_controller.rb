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

  def index
    @questions = Question.all.where(user_id: current_user.id)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    if Question.find(params[:id]).update(question_params)
      redirect_to question_path
    else
      render 'edit'
    end
  end

  def destroy
    if Question.find(params[:id]).destroy
      redirect_to questions_path
    else
      render 'show'
    end
  end
  private

  def question_params
    params.require(:question).permit(:problem_statement, :correct_answer).merge(user_id: current_user.id)
  end
end
