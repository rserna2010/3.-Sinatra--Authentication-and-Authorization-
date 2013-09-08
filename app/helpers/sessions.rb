
helpers do

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def login(user_id)
    session[:user_id] = user_id
  end

  def logout
    session.clear
  end

  def display_users
    @all_users = User.all 
  end



end
