class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :email
      t.integer :cnpj

      t.timestamps null: false
    end
  end
end
