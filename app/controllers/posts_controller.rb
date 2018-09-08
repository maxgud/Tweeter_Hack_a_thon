class PostsController < ApplicationController
  before_action :authenticate_profile!
 
  def index

  end

  def show
  end

  def new
    @post = @user.posts.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to [@user, @post]
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to [@user, @post]
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path
  end



end
