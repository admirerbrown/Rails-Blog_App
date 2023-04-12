class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @pagy, @user_posts = pagy(Post.where(author_id: @user.id).includes(:author))
    @user_comments = Comment.where(user_id: @user.id).includes(:post)
    @post_comments = Comment.where(post_id: @user_posts.ids).includes(:user)
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = Comment.where(post_id: @post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:notice] = 'Post created successfully!'
      @post.update_post_counter
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = "Couln't create post!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
