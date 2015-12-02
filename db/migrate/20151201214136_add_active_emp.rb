class AddActiveEmp < ActiveRecord::Migration
  def change
    add_column :users, :active_empresa, :int, default: 0
  end
end
