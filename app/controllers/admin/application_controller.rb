# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_filter :authenticate_admin
    before_action :authenticate_user!

    private

    def authenticate_admin
      not_found unless current_user && current_user.admin?
    end

    def not_found
      begin
        raise ActionController::RoutingError, 'Not Found'
      rescue
        redirect_to root_path, alert: "You do not have access to that resource!"
      end
    end
    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
