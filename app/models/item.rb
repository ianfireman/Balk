class Item < ActiveRecord::Base
  belongs_to :collection
  validates :collection_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :referencia, presence: true, length: { maximum: 140 },
                    uniqueness: { case_sensitive: false }
end
