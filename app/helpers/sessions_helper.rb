module SessionsHelper
  # Loga no usuario recebido
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Lembra o usuario em sessao persistente.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Retorna true se o usuario mandado for o usuario logado
  def current_user?(user)
    user == current_user
  end
  
  # Retorna o usuario logado, se tiver algum
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # Retorna true se o usuario estiver logado e falso caso contrario.
  def logged_in?
    !current_user.nil?
  end
  
  # Esquece usuario em sessao persistente
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  # Desloga o usuario atual
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Redireciona a um local guardado(ou o padrao)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Quarda a URL que esta tentando ser acessada
  def store_location
    session[:forwarding_url] = request.url if request.get? # so se o request for get, pois pode dar erro se for POST, PATCH ou delete
  end
end
