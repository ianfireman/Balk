module SessionsHelper
  # Loga no usuario recebido
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Retorna o usuario logado, se tiver algum
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # Retorna true se o usuario estiver logado e falso caso contrario.
  def logged_in?
    !current_user.nil?
  end
  
  # Desloga o usuario atual
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
