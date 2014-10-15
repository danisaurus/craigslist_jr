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
    session[:images_ids] = ""
    @image = Image.create(image: params[:image][:image])
    if @image.save
      session[:image_ids] << @image.id
    end
    erb :"classifieds/new"
end

post '/classifieds' do
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
