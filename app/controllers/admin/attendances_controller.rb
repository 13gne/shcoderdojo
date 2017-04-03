module Admin
  class AttendancesController < AdminBaseController
    def create
      @attendance = Attendance.new(attendance_params)

      respond_to do |format|
        if @attendance.save
          format.html { redirect_to course_registrations_path(course: @attendance.session.course), notice: 'Attenance successfully recorded.' }
        else
          format.html { render :back }
        end
      end
    end

    def destroy
      @attendance = set_attendance
      @attendance.destroy
      respond_to do |format|
        format.html { redirect_to :back }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_attendance
        @attendance = Attendance.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def attendance_params
        params.permit(:student_id, :session_id)
      end
  end
end
