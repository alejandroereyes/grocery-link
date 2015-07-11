class UsersController < ApplicationController
  before_filter do
    redirect_to root_path unless current_user && user_is_admin?
  end

  def index
    @users = current_retailer.first.users
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      Welcome.send_keys_to(@user).deliver_now
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
      end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def user_params
      params.require(:user).permit(:name, :admin, :client_id, :secret_id)
    end
end
