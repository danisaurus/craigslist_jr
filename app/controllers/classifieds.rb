get '/classifieds' do
  @categories = Category.all
  erb :"classifieds/index"
end

get '/classifieds/new' do
  @classified = Classified.new
  @categories = Category.all
  erb :"classifieds/new"
end


post'/classifieds/new' do
  @user = User.find(session[:user_id])
  @classified = Classified.new(
    title: params[:classified][:title],
    description: params[:classified][:description],
    condition: params[:classified][:condition],
    location: params[:classified][:location],
    zip_code: params[:classified][:zip_code],
    price: params[:classified][:price].to_f,
    category: Category.find(params[:classified][:category]),
    user: current_user)
  if @classified.save
    # params[:image][:image].each do | f |
    #     @classified.images << Image.create( image: f )
    # end
    redirect "/classifieds/#{@classified.id}"
  else
    @message = "Whoops! Something went wrong."
    erb :"classifieds/new"
  end
end

get '/classifieds/:id' do
  @classified = Classified.find(params[:id])
  erb :"classifieds/show"
end
