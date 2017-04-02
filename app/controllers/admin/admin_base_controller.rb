module Admin
  class AdminBaseController < ApplicationController
    before_filter :authorized?

    private

    def authorized?
      redirect_to '/', alert: "Not Authorized." unless user_signed_in? && current_user.admin?
    end
  end
end
