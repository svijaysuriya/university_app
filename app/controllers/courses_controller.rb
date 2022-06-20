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
        params.require(:course).permit(:short_name, :name, :description,:course_instructor)
      end
    
      def require_admin
        if !(logged_in? && current_user.admin?)
          flash[:alert] = "only admin can a create course :)"
          redirect_to courses_path
        end
      end

      def add_course_to_teacher
        course_add = Course.find(@course.id)
        
        if (!current_user.courses.include?(course_add)) && course_add.save 
          StudentCourse.create(course: course_add, user: @user)
          flash[:notice] = "You have succcessfully assigned a #{@user.name} teacher to #{course_add.name} course :)"
        else
          course_add.enrolled_students = course_add.enrolled_students 1
          flash[:notice] = "Something gone wrong with the assignment :("
        end
      end
end
								# <%= collection_select(:course_instructor, :id, User.all.where(ustype: "teacher"), :id, :name, prompt: true) %>
