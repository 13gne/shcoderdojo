module Admin
  class StudentsController < AdminBaseController
    def index

    end

    def show
      @user = User.find(params[:user_id])
      @student = Student.includes(:course_registrations).where(id: params[:id]).first
    end
  end
end
