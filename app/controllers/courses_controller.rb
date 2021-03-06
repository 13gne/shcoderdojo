class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.where(current: true, published: true).order(start_date: :desc)
    @unpublished_courses = Course.where(published: false).order(start_date: :desc)
    @past_courses = Course.where(current: false, published: true).order(created_at: :desc)
  end

  def show
    @sessions = @course.sessions.order(:session_date)
    @current_user_number_of_registrations = current_user_number_of_registrations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def current_user_number_of_registrations
    if current_user
      CourseRegistration.where(course_id: @course.id, user_id: current_user.id).count
    end
  end

  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:name, :start_date, :end_date, :description, :max_students, :resources, :published, :current)
  end
end
