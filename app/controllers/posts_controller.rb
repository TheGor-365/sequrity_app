class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    # search_parameter = 'Post'
    # @posts = Post.where("title like ?", search_parameter)
    search_parameter = "' OR '1'='1"
    @posts = Post.where("title like '%#{search_parameter}%'")
    # @posts = Post.all
    puts @posts.to_sql
  end

  def show; end
  def edit; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :user_id)
  end
end
