class AddColecIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :collection, index: true
    add_index :items, [:collection_id, :created_at]
    add_index :items, :referencia, unique: true
  end
end
