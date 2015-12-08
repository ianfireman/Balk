class AddPedidoId < ActiveRecord::Migration
  def change
    add_reference :relations, :pedido, index: true
    add_index :relations, [:pedido_id, :created_at]
  end
end
