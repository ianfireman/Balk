class Cliente < ActiveRecord::Base
  belongs_to :empresa
  validates :empresa_id, presence: true
  validates :nome_fantasia, presence: true, length: { maximum: 140 }
end
