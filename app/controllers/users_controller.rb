class UsersController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    before_action :set_user ,only: [:show, :edit, :update]
    before_action :require_same_user, only: [:edit,:update]

    def index
      @users = User.all
    end

    def new
      if logged_in?
        flash[:alert] = "You are already logged in :)"
        redirect_to current_user
      end
      @user = User.new
    end

    def create
      @user = User.new(student_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "You have successfully signed up"
        redirect_to @user
      else
        render 'new'
      end
    end

    def show
    end

    def edit
    end

    def update
      if @user.update(student_params)
        flash[:notice] = "Your profile updated successfully!"
        redirect_to (@user)
      else 
        render 'edit'
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def student_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :ustype)
    end

    def require_same_user
      if current_user!= @user
        if logged_in?
        flash[:alert] = "U can edit your own profile :)"
        redirect_to user_path(current_user)
        else
        flash[:alert] = "You need to login first :)"
        redirect_to login_path
        end
      end
    end
end