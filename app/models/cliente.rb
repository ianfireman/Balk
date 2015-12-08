class Cliente < ActiveRecord::Base
  belongs_to :empresa
  has_many :pedidos
  validates :empresa_id, presence: true
  validates :nome_fantasia, presence: true, length: { maximum: 140 }
end
