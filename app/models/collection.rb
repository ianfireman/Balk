class Collection < ActiveRecord::Base
  belongs_to :empresa
  validates :empresa_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
end
