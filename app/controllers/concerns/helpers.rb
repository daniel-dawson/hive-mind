module Helpers
  def current_user
    @current_user ||= Beekeeper.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    current_user.id == user.id
  end

  def get_beekeeper_with_username_or_redirect(username)
    if beekeeper = Beekeeper.find_by(username: username)
      beekeeper
    else
      flash[:warning] = "#{username} does not exist"
      redirect '/'
    end
  end

  def pluralize(quantity, singular, plural = nil)
    if quantity == 1
      "1 #{singular}"
    elsif plural
      "#{quantity} #{plural}"
    else
      "#{quantity} #{singular}s"
    end
  end
end
