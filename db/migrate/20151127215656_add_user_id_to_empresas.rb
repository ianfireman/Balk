class AddUserIdToEmpresas < ActiveRecord::Migration
  def change
    add_reference :empresas, :user, index: true, foreign_key: true
    add_index :empresas, [:user_id, :created_at]
  end
end
