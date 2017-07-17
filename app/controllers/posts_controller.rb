class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
  end

  def new
    # render the new post in the view
    @post = Post.new
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

  private

  def post_params
    # require bring in the post model and whitelist the post attr coming in
    params.require(:post).permit(:rationale, :date)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
