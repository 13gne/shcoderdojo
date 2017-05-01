module Admin
  class StudentAchievementsController < AdminBaseController
    before_action :set_student_achievement, only: [:show, :edit, :update, :destroy]
    before_action :set_user_and_student, only: [:new, :create, :show, :edit, :update, :destroy]

    # GET /student_achievements
    # GET /student_achievements.json
    def index
      @student_achievements = StudentAchievement.all.order(:sequence)
    end

    # GET /student_achievements/1
    # GET /student_achievements/1.json
    def show
    end

    # GET /student_achievements/new
    def new
      @student_achievement = StudentAchievement.new
    end

    # GET /student_achievements/1/edit
    def edit
    end

    # POST /student_achievements
    # POST /student_achievements.json
    def create
      @student_achievement = StudentAchievement.new(student_achievement_params)

      respond_to do |format|
        if @student_achievement.save
          format.html { redirect_to admin_student_student_achievements_path(user_id: @user.id, student_id: @student.id), notice: 'StudentAchievement was successfully created.' }
          format.json { render :show, status: :created, location: @student_achievement }
        else
          format.html { render :new }
          format.json { render json: @student_achievement.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /student_achievements/1
    # PATCH/PUT /student_achievements/1.json
    def update
      respond_to do |format|
        if @student_achievement.update(student_achievement_params)
          format.html { redirect_to admin_student_student_achievements_path(user_id: @user.id, student_id: @student.id), notice: 'StudentAchievement was successfully updated.' }
          format.json { render :show, status: :ok, location: @student_achievement }
        else
          format.html { render :edit }
          format.json { render json: @student_achievement.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /student_achievements/1
    # DELETE /student_achievements/1.json
    def destroy
      @student_achievement.destroy
      respond_to do |format|
        format.html { redirect_to admin_student_student_achievements_path(user_id: @user.id, student_id: @student.id), notice: 'StudentAchievement was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_student_achievement
        @student_achievement = StudentAchievement.find(params[:id])
      end

      def set_user_and_student
        @student = Student.find(params[:student_id])
        @user = User.find(params[:user_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def student_achievement_params
        params.require(:student_achievement).permit(:name, :sequence)
      end
  end
end
