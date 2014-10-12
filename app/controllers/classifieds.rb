get '/classifieds' do
  @categories = Category.all
  erb :"classifieds/index"
end

