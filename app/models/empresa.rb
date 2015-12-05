class Empresa < ActiveRecord::Base
  belongs_to :user
  has_many :clientes, dependent: :destroy
  has_many :collections, dependent: :destroy
  validates :user_id, presence: true
  validates :nome_fantasia, presence: true, length: { maximum: 140 }
end
