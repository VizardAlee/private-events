class UsersController < ApplicationController
  def show
    if params[:id] == "sign_out"
      sign_out_current_user
    else
      @user = User.find(params[:id])
    end
  end

  private

  def sign_out_current_user
    sign_out(current_user)
    redirect_to root_path, notice: 'Signed out successfully.'
  end
end
