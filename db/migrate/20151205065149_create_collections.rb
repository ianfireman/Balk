class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.date :data_inicio

      t.timestamps null: false
    end
  end
end
