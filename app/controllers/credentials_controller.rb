class CredentialsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(credentials_params)
      redirect_to root_path, notice: "Credenciais TOTVS atualizadas"
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def credentials_params
    params.require(:user).permit(:totvs_username, :totvs_password)
  end
end