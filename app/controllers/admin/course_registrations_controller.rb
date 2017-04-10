module Admin
  class CourseRegistrationsController < AdminBaseController
    def index
      @course = Course.find(params[:course_id])
      @sessions = Session.where(course_id: @course.id).order(:session_date)
      @q = CourseRegistration.where(course: @course).ransack(params[:q])
      @q.sorts = 'students.name' if @q.sorts.empty?
      @course_registrations = @q.result
    end

    def create
      @course_registration = CourseRegistration.new(course_registration_params)
      @student = Student.find(@course_registration.student.id)
      @course_registration.user_id = @student.user.id

      respond_to do |format|
        if @course_registration.save
          format.html { redirect_to admin_user_student_path(user_id: @student.user.id, id: @student.id), notice: 'Successfully registered.' }
        else
          format.html { render :new }
        end
      end
    end

    def destroy
      @course_registration = CourseRegistration.find(params[:id])
      @course_registration.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Course registration was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def new
      @user = User.find(params[:user_id])
      @student = Student.find(params[:student_id])
      @course_registration = CourseRegistration.new do |c|
        c.user_id = @user.id
        c.student_id = @student.id
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_course_registration
        @course_registration = CourseRegistration.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def course_registration_params
        params.require(:course_registration).permit(:user_id, :student_id, :course_id)
      end
  end
end
