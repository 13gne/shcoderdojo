module Admin
  class CourseRegistrationsController < AdminBaseController
    def index
      @course = Course.find(params[:course_id])
      @sessions = Session.where(course_id: @course.id).order(:session_date)
      @q = CourseRegistration.where(course: @course).ransack(params[:q])
      Rails.logger.debug "SORTS before: #{@q.sorts}"
      @q.sorts = 'students.name' if @q.sorts.empty?
      Rails.logger.debug "SORTS: #{@q.sorts}"
      @course_registrations = @q.result.includes(:student)
    end
  end
end
