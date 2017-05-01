module Admin
  class CoursesController < AdminBaseController
    before_action :set_course, only: [:edit, :update, :destroy]

    def edit

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_course
        @course = Course.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def course_params
        params.require(:course).permit(:name, :start_date, :end_date, :description, :max_students, :resources, :published)
      end
  end
end
