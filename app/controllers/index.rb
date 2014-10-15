get '/' do
  @user = User.new()
  erb :"/users/login", :layout => :'/login_layout'
end


post '/' do
  @user = User.find_by(email: params[:user][:email])
  if @user != nil && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/classifieds'
  else
    @message = "You've got the wrong ingredients. Try again."
    erb :"/users/login", :layout => :'/login_layout'
  end
end

get '/signup' do
  @user = User.new()
  erb :"/users/new", :layout => :'/login_layout'
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
  redirect '/'
  else
    erb :"/users/new", :layout => :'/login_layout'
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

