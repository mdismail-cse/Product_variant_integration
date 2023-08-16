class Variant < ApplicationRecord

  validates_numericality_of :stock, :greater_than => 0
  validates_numericality_of :price, :greater_than => 0

  belongs_to :product

  has_many :variant_atr_values
  has_many :atr_values, through: :variant_atr_values
end
