module Helpers
  def current_user
    @current_user ||= Beekeeper.find(session[:user_id])
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def login(user)
    session[:user_id] = user.id
  end

  def pluralize(quantity, singular, plural)
    if quantity == 1
        "1 #{singular}"
    else
        "#{quantity} #{plural}"
    end
  end
end
