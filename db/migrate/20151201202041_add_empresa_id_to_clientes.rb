class AddEmpresaIdToClientes < ActiveRecord::Migration
  def change
    add_reference :clientes, :empresa, index: true
    add_index :clientes, [:empresa_id, :created_at]
  end
end
