class AnswersController < ApplicationController
  def new 
    @answer = Answer.new
    @question = Question.find(params[:question_id])

  end

  def create
    @answer = Answer.new(answers_params)
    byebug
    @answer.user_id = 1 ##
    if @answer.save
      flash[:notice] = "Answer successfully posted!"
      redirect_to Question.find(@answer.question_id)
    else
      render 'new'
    end
  end

  def edit 
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    byebug
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.user_id = 1 ##
    if @answer.update(answers_params)
      flash[:notice] = "Your answer is successfully updated!"
      redirect_to Question.find(@answer.question_id)
    else 
      @question =  Question.find(@answer.question_id)
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    if @answer.destroy
      flash[:notice] = "Your Answer is successfully deleted!"
      redirect_to Question.find(@answer.question_id)
    else
      flash[:alert] = "Something gone wrong with deletion of answers!"
      redirect_to Question.find(@answer.question_id)
    end
  end
  private
  def answers_params
    params.require(:answer).permit(:solution, :question_id)
  end
end