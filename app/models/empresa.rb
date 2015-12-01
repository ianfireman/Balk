class Empresa < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :nome_fantasia, presence: true, length: { maximum: 140 }
end
