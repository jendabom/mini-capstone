class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    current_user && current_user.admin
  end
end
