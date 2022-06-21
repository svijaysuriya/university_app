class StudentCoursesController < ApplicationController

  def create
    course_add = Course.find(params[:course_id])
    course_add.enrolled_students = course_add.enrolled_students + 1
    
    if (current_user && (!current_user.courses.include?(course_add)) && course_add.save )
      StudentCourse.create(course: course_add, user: current_user)
      flash[:notice] = "You have succcessfully enrolled in #{course_add.name} course :)"
      redirect_to current_user
    else
      flash[:alert] = "Something gone wrong with the enrollment :("
      redirect_to courses_path
    end
  end
end