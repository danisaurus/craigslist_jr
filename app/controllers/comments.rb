post '/post/:post_id/comments' do
  @comment = Comment.new(params[:comment])
  @comment.user_id = current_user.id
  @comment.post_id = 
  if @comment.save
   	erb :"commments/_comment", layout: false, :locals => { @comment: comment }
  else
  	erb :"posts/show", layout: false 
  end
end

