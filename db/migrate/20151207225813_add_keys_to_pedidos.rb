class AddKeysToPedidos < ActiveRecord::Migration
  def change
    add_reference :relations, :cliente, index: true
    add_reference :relations, :item, index: true
    add_index :relations, [:cliente_id, :created_at, :item_id]
  end
end