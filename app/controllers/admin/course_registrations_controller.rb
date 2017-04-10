module Admin
  class CourseRegistrationsController < AdminBaseController
    def index
      @course = Course.find(params[:course_id])
      @sessions = Session.where(course_id: @course.id).order(:session_date)
      @q = CourseRegistration.where(course: @course).ransack(params[:q])
      @q.sorts = 'students.name' if @q.sorts.empty?
      @course_registrations = @q.result.includes(:student)
    end

    def destroy
      @course_registration = CourseRegistration.find(params[:id])
      @course_registration.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Course registration was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
end
