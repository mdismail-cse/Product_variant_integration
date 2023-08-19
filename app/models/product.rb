class Product < ApplicationRecord

  has_many :product_atributes
  has_many :atributes, through: :product_atributes
  has_many :variants


  accepts_nested_attributes_for :product_atributes, allow_destroy: true
  accepts_nested_attributes_for :variants, allow_destroy: true


end
