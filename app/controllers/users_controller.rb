class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def profile
    @user = current_user 
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to profile_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(
      :user_name,
      :profile,
      :profile_image
    )
  end
end
