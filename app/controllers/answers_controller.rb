class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def new 
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answers_params)
    # byebug
    @answer.user_id = current_user.id
    if @answer.save
      flash[:notice] = "Answer successfully posted!"
      redirect_to Question.find(@answer.question_id)
    else
      @question =  Question.find(@answer.question_id)
      render 'new'
    end
  end

  def edit 
    
    @question = Question.find(params[:question_id])
    # byebug
  end
  
  def update
    
    @answer.user_id = current_user.id
    if @answer.update(answers_params)
      flash[:notice] = "Your answer is successfully updated!"
      redirect_to Question.find(@answer.question_id)
    else 
      @question =  Question.find(@answer.question_id)
      render 'edit'
    end
  end

  def destroy
    
    if @answer.destroy
      flash[:notice] = "Your Answer is successfully deleted!"
      redirect_to Question.find(@answer.question_id)
    else
      flash[:alert] = "Something gone wrong with deletion of answers!"
      redirect_to Question.find(@answer.question_id)
    end
  end
  private
  def set_answer
    @answer = Answer.find(params[:id])
  end
  def answers_params
    params.require(:answer).permit(:solution, :question_id)
  end
  def require_same_user
    if @answer.user_id != current_user.id
      flash[:alert] = "You can only edit or delete your own questions ;)"
      redirect_to questions_path
    end
  end
end