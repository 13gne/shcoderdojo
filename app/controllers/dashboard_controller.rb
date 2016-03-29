class DashboardController < ApplicationController
  def index
    @students = current_user.students.all
    @student = current_user.students.build
    @course_registration = current_user.course_registrations.build
  end
end
