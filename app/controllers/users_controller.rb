class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update, :show]
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
      flash[:success] = "Bem vindo " + @user.name + "!"
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
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # Before filters

    # Confirma um usuario logado
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Você não esta Logado."
        redirect_to login_url
      end
    end
    
    # Confirmar se o usuario é o certo
    def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user || root_url) unless current_user?(@user)
    end
    
end
