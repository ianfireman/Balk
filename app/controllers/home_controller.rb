class HomeController < ApplicationController
  layout "formL", except: [:admin]
  
  def index
    render :layout => false
  end
  
  def admin
    if(current_user.active_empresa > 0)
      @clientes = current_empresa.clientes.all
      @hash = Gmaps4rails.build_markers(@clientes) do |cliente, marker|
        marker.lat cliente.latitude
        marker.lng cliente.longitude
        marker.infowindow cliente.nome_fantasia
      end
    end
  end
end
