get '/' do
  @user = User.new()
  erb :login
end


post '/' do
  @user = User.find_by(email: params[:user][:email])
  if @user != nil && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/home'
  else
    @message = "You've got the wrong ingredients. Try again."
    redirect '/'
  end
end

get '/signup' do
  @user = User.new()
  erb :signup
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
  redirect '/'
  else
    erb :signup
  end
end

before '/home' do
  if authenticated?
    pass
  else
    redirect '/'
  end
end

get '/home' do
  @user = current_user
  erb :homepage
end


get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

