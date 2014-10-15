get '/posts' do
  @user =
  @posts = Posts.all
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

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  @comments = @post.comments
  @replies = @comments.replies
end
