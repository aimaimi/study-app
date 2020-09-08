class QuestionsController < ApplicationController
  before_action :move_to_show, only: [:edit]

  def new
    @question = Question.new
    @user = User.find(params[:user_id])
  end

  def create
    @question = Question.new(question_params)
    if @question.valid?
      @question.save
      redirect_to user_path(current_user)
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @questions = Question.all.where(user_id: @user.id)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.where(user_id: current_user.id)
    @user = User.find(params[:user_id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @user = User.find(params[:user_id])
    if @question.update(question_update_params)
      redirect_to user_question_path(@user.id, @question.id)
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @user = User.find(params[:user_id])
    if Question.find(params[:id]).destroy
      redirect_to user_questions_path(@user.id, @question.id)
    else
      render 'show'
    end
  end

  private

  def question_params
    params.permit(:problem_statement, :correct_answer).merge(user_id: current_user.id)
  end

  def question_update_params
    params.require(:question).permit(:problem_statement, :correct_answer).merge(user_id: current_user.id)
  end

  def move_to_show
    @user = User.find(params[:user_id])
    redirect_to action: :show unless current_user.id == @user.id
  end
end
