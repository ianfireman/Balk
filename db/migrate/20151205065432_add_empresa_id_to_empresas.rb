class AddEmpresaIdToEmpresas < ActiveRecord::Migration
  def change
    add_reference :collections, :empresa, index: true
    add_index :collections, [:empresa_id, :created_at]
  end
end
