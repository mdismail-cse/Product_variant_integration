class Product < ApplicationRecord


  has_many :product_atributes
  has_many :atributes, through: :product_atributes

  has_many :variants


end
