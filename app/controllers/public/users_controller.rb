class Public::UsersController < ApplicationController
  def top
  end

  def edit
  end

  def show
    @user = User.find(current_user.id)
  end

  def update
  end

  def destroy
  end

  def cancel
  end
end
