class DeleteAdress < ActiveRecord::Migration
  def change
    remove_column :clientes, :address
    remove_column :clientes, :cep
    remove_column :clientes, :city
    remove_column :clientes, :uf
  end
end
