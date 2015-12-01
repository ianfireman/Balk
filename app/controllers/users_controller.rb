class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show, :destroy]
  before_action :correct_user,   only: [:edit, :update, :show, :destroy]
  layout "formL", except: [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
     @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Por favor verifique seu email para fazer a ativaçao da sua conta."
      redirect_to login_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil Atualizado"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario Deletado"
    redirect_to root_url
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # Before filters
    
    # Confirmar se o usuario é o certo
    def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user || root_url) unless current_user?(@user)
    end
    
end
