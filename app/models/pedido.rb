class Pedido < ActiveRecord::Base
  belongs_to :cliente
  has_many :relations, dependent: :destroy
  accepts_nested_attributes_for :relations, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  validates :cliente_id, presence: true
end
