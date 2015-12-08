class Relation < ActiveRecord::Base
  belongs_to :pedido
  validates :item_id, presence: true
  validates :pedido_id, presence: true
end
