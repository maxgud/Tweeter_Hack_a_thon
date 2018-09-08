class UsersController < ApplicationController
  before_action :authenticate_profile!
  before_action :set_user, only: [:show, :update, :edit, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
