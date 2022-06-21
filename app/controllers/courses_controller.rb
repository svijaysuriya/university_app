class CoursesController < ApplicationController
    before_action :set_course ,only: [:show, :edit, :update, :destroy]
    before_action :require_admin, except: [:show, :index]
    def show
      @user = User.find_by(name: @course.course_instructor) 
    end

    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
      @course = Course.new(course_params)
      @user = User.find_by(name: @course.course_instructor) 

      if @course.save! && add_course_to_teacher
        flash[:notice] = "You have successfully created a course :)"
        redirect_to @course
      else
        render 'new'
      end
    end

    def edit
      $oldid = User.find_by(name: @course.course_instructor).id
    end

    def update
      @user = User.find_by(name: params[:course][:course_instructor]) 
      update_student_course = StudentCourse.find_by(course_id: @course.id,user_id:$oldid)
      
      update_student_course.user_id = @user.id
      if update_student_course.save
        flash[:alert] = "Student Course table is successfully updated!"
      else
        flash[:alert] = "something went wrong"
        byebug
      end
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
        params.require(:course).permit(:short_name, :name, :description,:course_instructor)
      end
    
      def require_admin
        if !(logged_in? && current_user.admin?)
          flash[:alert] = "only admin can a create or edit course :)"
          redirect_to courses_path
        end
      end
end
								# <%= collection_select(:course_instructor, :id, User.all.where(ustype: "teacher"), :id, :name, prompt: true) %>
