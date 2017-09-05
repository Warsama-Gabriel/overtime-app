class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = current_user.posts
  end

  def new
    # render the new post in the view
    @post = Post.new
  end

  def edit
    authorize @post
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was edited successfully'
    else
      render :edit
    end
  end

  def create
    # save it in the database
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def show
    # find the post from the database
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Your post was deleted'
  end

  private

  def post_params
    # require bring in the post model and whitelist the post attr coming in
    params.require(:post).permit(:rationale, :date, :status)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
