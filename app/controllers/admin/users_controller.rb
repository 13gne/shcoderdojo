module Admin
  class UsersController < AdminBaseController
    def index
      @q = User.search(params[:q])
      Rails.logger.debug "SORTS before: #{@q.sorts}"
      @q.sorts = 'name asc' if @q.sorts.empty?
      Rails.logger.debug "SORTS: #{@q.sorts}"
      @users = @q.result.includes(:students)
    end

    def show
      @user = User.includes(:students).find(params[:id])
    end
  end
end
