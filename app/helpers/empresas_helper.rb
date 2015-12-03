module EmpresasHelper
  
  def empresas_Existentes
    @empresas = current_user.empresas.all
  end
end
