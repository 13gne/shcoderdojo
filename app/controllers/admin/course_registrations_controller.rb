module Admin
  class CourseRegistrationsController < AdminBaseController
    def index
      @course = Course.find(params[:course_id])
      @sessions = Session.where(course_id: @course.id).order(:session_date)
      @q = CourseRegistration.where(course: @course).ransack(params[:q])
      @q.sorts = 'students.name' if @q.sorts.empty?
      @course_registrations = @q.result.includes(:student)
    end
  end
end
