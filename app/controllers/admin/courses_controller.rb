module Admin
  class CoursesController < AdminBaseController
    before_action :set_course, only: [:edit, :update, :destroy]

    def create
      @course = Course.new(course_params)

      respond_to do |format|
        if @course.save
          format.html { redirect_to @course, notice: 'Course was successfully created.' }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit

    end

    def new
      @course = Course.new
    end

    def update
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to @course, notice: 'Course was successfully updated.' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
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
      params.require(:course).permit(:name, :start_date, :end_date, :description, :max_students, :resources, :published, :current, :minimum_level)
    end
  end
end
