class SessionsController < ApplicationController

  def new

  end

  def create
    @student = Student.find_by(email: params[:sessions][:email])
    if @student && @student.authenticate(params[:sessions][:password])
      session[:student_id] = @student.id
      flash[:notice] = "Logged in successfully! :)"
      redirect_to @student
    else
      flash.now[:alert] = "login in details incorrect :(" 
      render 'new'
    end
  end

  def destroy
    session[:student_id]=nil
    flash[:notice] = "Logged out successfully! :)"
    redirect_to root_path
  end
  
  private

  def sessions_params
    params.require(:sessions).permit(:email, :password)
  end
end