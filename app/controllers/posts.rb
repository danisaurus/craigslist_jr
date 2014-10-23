get '/posts' do
  @user = User.find(session[:user_id])
  @posts = Post.all
  erb :"posts/index"
end

get 'posts/new' do
  @user = User.find(session[:user_id])
  erb :"posts/new"
end

post '/posts' do
  @post = Post.create(params[:post])
  if @post.save
    redirect '/posts'
  else
    erb :"posts/new"
  end
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  @comments = @post.comments
  erb :"posts/show"
end

post '/posts/:post_id/upvotes' do
  @post = Post.find(params[:post_id])
  @post.increase_upvotes
  @post.save
  {upvotes: @post.upvotes}.to_json
end

post '/posts/:post_id/downvotes' do
  @post = Post.find(params[:post_id])
  @post.increase_downvotes
  @post.save
  {downvotes: @post.downvotes}.to_json
end
