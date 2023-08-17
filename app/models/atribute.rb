class Atribute < ApplicationRecord



  has_many :product_atributes
  has_many :products, through: :product_atributes
  has_many :atr_values


  accepts_nested_attributes_for :atr_values, allow_destroy: true

end
