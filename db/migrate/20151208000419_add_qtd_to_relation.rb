class AddQtdToRelation < ActiveRecord::Migration
  def change
    add_column :relations, :quantidade, :integer
  end
end
