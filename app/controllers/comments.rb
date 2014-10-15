post 'posts/:post_id/comments' do
   @post = Post.find(params[:post_id])
   @user = User.find(session[:user_id])
   @comment = Comment.new(params[:comment])
end

