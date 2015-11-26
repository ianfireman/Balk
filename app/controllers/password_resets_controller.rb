class PasswordResetsController < ApplicationController
  layout 'formL'
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end
  
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Um email com as instruçõs necessarias foi enviado com sucesso."
      redirect_to login_path
    else
      flash.now[:danger] = "Email não encontrado."
      render 'new'
    end
  end

  def edit
  end
  
   def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
    
    # Before filters
    
    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirma se o usuario é valido
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to login_path
      end
    end

    # Checa expiraçao do token
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Link de recuperação expirado"
        redirect_to new_password_reset_url
      end
    end
    
end
