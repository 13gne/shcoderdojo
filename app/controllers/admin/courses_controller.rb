module Admin
  class CoursesController < AdminBaseController
    before_action :set_course, only: [:edit, :update, :destroy]

    def edit

    end

    def destroy
      @course.destroy
      respond_to do |format|
        format.html { redirect_to :back, alert: 'Course successfully removed' }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_course
        @course = Course.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def course_params
        params.require(:course).permit(:name, :start_date, :end_date, :description, :max_students, :resources, :published, :current)
      end
  end
end
