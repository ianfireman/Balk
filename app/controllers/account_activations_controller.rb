class AccountActivationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Conta ativada com sucesso!"
      redirect_to user
    else
      flash[:danger] = "Link de ativação invalido."
      redirect_to login_path
    end
  end
  
end
