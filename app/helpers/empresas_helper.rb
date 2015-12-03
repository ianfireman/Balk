module EmpresasHelper
  
  def empresas_Existentes
    @empresas = current_user.empresas.all
  end
  
  def empresa_ativa?
     current_empresa.id > 0 ? true : false
  end
end
