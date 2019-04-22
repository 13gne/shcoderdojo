module Admin
  class CurrentRegistrationsController < AdminBaseController
    def index
      @courses = Course.where(current: true, published: true)
    end
  end
end