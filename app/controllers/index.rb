get '/' do
  if current_user 
    display_users
    erb :index
  else
    erb :index
  end

end

#----------- SESSIONS -----------

get '/sessions/new' do
  
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
    
    if @user.nil? 
      redirect to '/'
    elsif @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/'
    else
      redirect to '/'
    end 
end

delete '/sessions/:id' do
  logout

   erb :sign_in 
end


#----------- USERS -----------

get '/users/new' do
  
  erb :sign_up
end

post '/users' do
  @user = User.new(name: params[:name], email: params[:email])
  @user.password = params[:password]
  @user.save!
  session[:user_id] = @user.id

  redirect to '/'
end
