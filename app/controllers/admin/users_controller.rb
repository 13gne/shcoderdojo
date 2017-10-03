module Admin
  class UsersController < AdminBaseController
    before_action :set_user, only: [:edit, :update]
    def index
      @q = User.search(params[:q])
      @q.sorts = 'name asc' if @q.sorts.empty?
      @users = @q.result.includes(:students)
    end

    def edit
    end

    def show
      @user = User.includes(:students).find(params[:id])
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admin_user_path(@user) }
        else
          format.html { render :edit }
        end
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :mobile_number, :role)
    end
  end
end
