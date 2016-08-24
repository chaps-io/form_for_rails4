class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = UserCreator.run(params[:user].to_hash)

    if @user.errors.empty?
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    @user = UserCreator.run(params[:user].to_hash.merge(user: user))

    redirect_to user_path(user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url, notice: 'User was successfully destroyed.'
  end
end
