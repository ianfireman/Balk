module PedidosHelper
  
  def current_pedidos
    @clientes = current_empresa.clientes.all
    @clientes.pedidos
  end
    
end
