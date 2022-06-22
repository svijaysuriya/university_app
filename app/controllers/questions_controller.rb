class QuestionsController < ApplicationController
  
  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create 
    @question = Question.new(questions_params)
    @question.user_id = 1
    if @question.save
      flash[:notice] = "Question successfully posted!"
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end
  def update
    @question = Question.find(params[:id])
    byebug
    if @question.update(questions_params)
      flash[:notice] = "Question successfully updated!"
      redirect_to @question
    else
      render 'edit'
    end
  end
  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "Question is successfully deleted!"
      redirect_to questions_path
    else
      flash[:alert] = "Something gone wrong with deletion of question!"
      redirect_to questions_path
    end    
  end
  def course_questions
    if params[:id] == nil
      redirect_to questions_path
    else
      @questions = Question.where(course_id: params[:id])
      render 'index'
    end
  end
  private
  def questions_params
    params.require(:question).permit(:doubt, :course_id)
  end
end