class CommentsController < ApplicationController
  http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy
  
  def create
      @post = Post.find(params[:post_id])
      params[:comment][:commenter] = @user.login
      @comment = @post.comments.create(params[:comment])
      redirect_to "/home/post?id=#{@post.id}"
    end
  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)
    end
end
