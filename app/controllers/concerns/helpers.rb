module Helpers
  def current_user
    @current_user ||= Beekeeper.find(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
