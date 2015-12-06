class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :referencia
      t.float :preco_unitario
      t.string :info

      t.timestamps null: false
    end
  end
end
