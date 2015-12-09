class Cliente < ActiveRecord::Base
  belongs_to :empresa
  has_many :pedidos, dependent: :destroy
  validates :empresa_id, presence: true
  validates :nome_fantasia, presence: true, length: { maximum: 140 }
  
  geocoded_by :adress
  after_validation :geocode
end
