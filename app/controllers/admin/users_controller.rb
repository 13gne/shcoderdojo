module Admin
  class UsersController < AdminBaseController
    def index
      @users = User.all.order(:name).includes(:students)
    end
  end
end
