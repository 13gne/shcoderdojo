module Admin
  class CurrentRegistrationsController < AdminBaseController
    def index
      @current_courses = Course.where(current: true, published: true).includes(course_registrations: :student)
    end
  end
end