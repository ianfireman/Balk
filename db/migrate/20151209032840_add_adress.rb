class AddAdress < ActiveRecord::Migration
  def change
    add_column :clientes, :longitude, :float
    add_column :clientes, :latitude, :float
    add_column :clientes, :adress, :string
  end
end
