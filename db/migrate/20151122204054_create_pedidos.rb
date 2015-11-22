class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :qtd_itens
      t.float :preco_total

      t.timestamps null: false
    end
  end
end
