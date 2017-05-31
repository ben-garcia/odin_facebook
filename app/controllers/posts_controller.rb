class PostsController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post created"
    else
      flash[:alert] = "Post creation failed"
    end
    redirect_to current_user
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post '#{@post.title}' deleted"
    else
      flash[:alert] = "Couln't delete '#{@post.title}' deleted"
    end
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
