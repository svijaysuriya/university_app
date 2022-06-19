class StudentCoursesController < ApplicationController

  def create
    course_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_add)
      StudentCourse.create(course: course_add, student: current_user)
      flash[:notice] = "You have succcessfully enrolled in #{course_add.name} course :)"
      redirect_to current_user
    else
      flash[:notice] = "Something gone wrong with the enrollment :("
      redirect_to courses_path
    end
  end
end