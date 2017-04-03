module Admin
  class UsersController < AdminBaseController
    def index
      @q = User.search(params[:q])
      @q.sorts = 'name asc' if @q.sorts.empty?
      @users = @q.result.includes(:students)
    end
  end
end
