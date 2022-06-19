class CoursesController < ApplicationController
    before_action :set_course ,only: [:show, :edit, :update]

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

    end

    def destroy

    end

    private

    def set_course
        @course = Course.find(params[:id])
      end
    
      def course_params
        params.require(:course).permit(:short_name, :name, :description)
      end
    
      def require_same_user
        if current_user!= @student
          flash[:alert] = "U can edit your own profile :)"
          redirect_to student_path(current_user)
        end
      end

end