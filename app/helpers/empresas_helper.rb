module EmpresasHelper
  
  def empresas_Existentes
    @empresas = current_user.empresas.all
  end
  
  def empresa_ativa?
     current_user.active_empresa > 0 ? true : false
  end
  
end
