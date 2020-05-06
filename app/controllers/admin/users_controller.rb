class Admin::UsersController < ApplicationController
  def top
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

end
