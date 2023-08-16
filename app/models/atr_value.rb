class AtrValue < ApplicationRecord
  belongs_to :atribute

  has_many :variant_atr_values
  has_many :variants, through: :variant_atr_values
end
