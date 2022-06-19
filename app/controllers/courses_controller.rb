class CoursesController < ApplicationController
    before_action :set_course ,only: [:show, :edit, :update, :destroy]
    before_action :require_admin, except: [:show, :index]
    def show

    end

    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
      if @course.save
        flash[:notice] = "You have successfully created a course :)"
        redirect_to @course
      else
        render 'new'
      end
    end

    def edit

    end

    def update
      if @course.update(course_params)
        flash[:notice] = "#{@course.name} Course is successfully updated!"
        redirect_to course_path(@course)
      else 
        render 'edit'
      end
    end

    def destroy
      @course.destroy
      flash[:notice] = "Course deleted successfully :)"
      redirect_to courses_path
    end

    private

    def set_course
        @course = Course.find(params[:id])
      end
    
      def course_params
        params.require(:course).permit(:short_name, :name, :description)
      end
    
      def require_admin
        if !(logged_in? && current_user.admin?)
          flash[:alert] = "only admin can a create course :)"
          redirect_to courses_path
        end
      end

end