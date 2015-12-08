class AddClienteIdToPed < ActiveRecord::Migration
  def change
    add_reference :pedidos, :cliente, index: true
    add_index :pedidos, [:cliente_id, :created_at]
  end
end
