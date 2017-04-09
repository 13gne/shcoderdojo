module Admin
  class CourseRegistrationsController < AdminBaseController
    def index
      @course = Course.find(params[:course_id])
      @sessions = Session.where(course_id: @course.id).order(:session_date)
      @course_registrations = CourseRegistration.where(course: @course).includes(:student).order('students.name')
    end
  end
end
