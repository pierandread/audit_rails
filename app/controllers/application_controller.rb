class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    user_signed_in? ? current_user.email : "Anonymous"
  end
end
