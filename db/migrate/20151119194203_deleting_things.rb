class DeletingThings < ActiveRecord::Migration
  def change
    change_table(:clientes) do |t|
      t.remove :address
      t.remove :city, :uf, :cep
    end
  end
end
