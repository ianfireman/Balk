class DeletingAdre < ActiveRecord::Migration
  def change
    change_table(:clientes) do |t|
      t.remove :address
    end
  end
end
