class CourseRegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course_registration, only: [:show, :edit, :update, :destroy]

  # GET /course_registrations
  # GET /course_registrations.json
  def index
    @course = Course.find(params[:course])
    @sessions = Session.where(course_id: @course.id).order(:session_date)
    if current_user.admin?
      @course_registrations = CourseRegistration.where(course: @course).includes(:student).order('students.name')
    else
      @course_registrations = current_user.course_registrations.where(course: @course)
    end
  end

  # GET /course_registrations/1
  # GET /course_registrations/1.json
  def show
  end

  # GET /course_registrations/new
  def new
    @course_registration = current_user.course_registrations.new
    @course = Course.find(params[:course_id])
    @course_registration.course_id = @course.id
  end

  # GET /course_registrations/1/edit
  def edit
  end

  # POST /course_registrations
  # POST /course_registrations.json
  def create
    @course_registration = CourseRegistration.new(course_registration_params)
    @course = @course_registration.course

    respond_to do |format|
      if @course_registration.save
        format.html { redirect_to @course, notice: 'Successfully registered. We look forward to seeing you there!' }
        format.json { render :show, status: :created, location: @course_registration }
      else
        format.html { render :new }
        format.json { render json: @course_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_registrations/1
  # PATCH/PUT /course_registrations/1.json
  def update
    respond_to do |format|
      if @course_registration.update(course_registration_params)
        format.html { redirect_to @course_registration, notice: 'Course registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_registration }
      else
        format.html { render :edit }
        format.json { render json: @course_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_registrations/1
  # DELETE /course_registrations/1.json
  def destroy
    @course_registration.destroy
    respond_to do |format|
      format.html { redirect_to course_registrations_url, notice: 'Course registration was successfully destroyed.' }
      format.json { head :no_content }
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
