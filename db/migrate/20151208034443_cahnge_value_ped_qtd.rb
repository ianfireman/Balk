class CahngeValuePedQtd < ActiveRecord::Migration
  def change
    change_column :relations, :quantidade, :integer, default: 0
  end
end
