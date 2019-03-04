module Admin
  class StudentsController < AdminBaseController
    before_action :set_user_and_student, only: [:edit, :show, :update]

    def index
    end

    def edit
    end

    def show
    end

    def update
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to admin_user_student_path(user_id: @user.id, student_id: @student.id) }
        else
          format.html { render :edit }
        end
      end
    end

    private

    def set_user_and_student
      @user = User.find(params[:user_id])
      @student = Student.includes(:course_registrations).find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :grade, :experience, :bag_achievement)
    end
  end
end
