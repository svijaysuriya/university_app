class QuestionsController < ApplicationController
  skip_before_action :require_user, only: [:show, :index]
  before_action :set_question, only: [:show, :edit, :update, :destroy, :question_vote]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def show
    if @question.view_count == nil
      @question.view_count = 0
    else
      @question.view_count += 1
    end
    if !@question.save
      flash[:alert]="view count did not update!!"
    end
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create 
    @question = Question.new(questions_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "Question successfully posted!"
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
    
  end
  def update
    
    # byebug
    if @question.update(questions_params)
      flash[:notice] = "Question successfully updated!"
      redirect_to @question
    else
      render 'edit'
    end
  end
  def destroy
    
    if @question.destroy
      flash[:notice] = "Question successfully deleted!"
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

  def question_vote
    # byebug
    if params[:val] == "1"
      if @question.vote_count == nil
        @question.vote_count=1 
      else 
        @question.vote_count+=1
      end
      flash[:notice]= "question upvoted successfully"
    else
      if @question.vote_count == nil
        @question.vote_count=1 
      else 
        @question.vote_count-=1
      end
      flash[:alert]= "question downvoted successfully"
    end
    @question.view_count-=1
   @question.save
   redirect_to @question
  end

  def answer_vote
    # byebug
    @answer = Answer.find((params[:id]).to_i)
    if params[:val] == "1"
      if @answer.vote_count == nil
        @answer.vote_count=1 
      else 
        @answer.vote_count+=1
      end
      flash[:notice]= "answer upvoted successfully"
    else
      if @answer.vote_count == nil
        @answer.vote_count=1 
      else 
        @answer.vote_count-=1
      end
      flash[:alert]= "answer downvoted successfully"
    end
   @answer.save
   redirect_to Question.find(@answer.question_id)
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end
  def questions_params
    params.require(:question).permit(:doubt, :course_id)
  end
  def require_same_user
    if @question.user_id != current_user.id
      flash[:alert] = "You can only edit or delete your own questions ;)"
      redirect_to @question
    end
  end
end