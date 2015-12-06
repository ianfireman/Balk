class Collection < ActiveRecord::Base
  belongs_to :empresa
  has_many :items, dependent: :destroy
  validates :empresa_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
end
