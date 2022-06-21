class SessionsController < ApplicationController
  
  def new
    if logged_in?
      flash[:alert]="You are already logged in"
      redirect_to current_user
    end
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in successfully! :)"
      redirect_to @user
    else
      flash.now[:alert] = "login in details incorrect :(" 
      render 'new'
    end
  end

  def destroy
    session[:user_id]=nil
    flash[:notice] = "Logged out successfully! :)"
    redirect_to root_path
  end
  
  private

  def sessions_params
    params.require(:sessions).permit(:email, :password)
  end
end