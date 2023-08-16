class VariantAtrValue < ApplicationRecord

  validate :validate_atr_variant_presence, on: [:create, :update]
  validate :validate_variant_product_and_attribute, on: [:create,:update]

  belongs_to :variant
  belongs_to :atr_value


  private

  def validate_variant_product_and_attribute
    # Check if the variant_id corresponds to a valid product
    unless variant&.product
      errors.add(:variant_id, "is not associated with a valid product")
      return
    end

    # Check if the associated attribute value exists for the product
    unless variant.product.atributes.exists?(id: atr_value&.atribute_id)
      errors.add(:atr_value_id, "is not associated with a valid attribute for the product")
    end
  end




  def validate_atr_variant_presence
    existing_record = VariantAtrValue.find_by(variant_id: variant_id, atr_value_id: atr_value_id)

    if existing_record && existing_record != self
      errors.add(:Asset, "Already assigned")
    end
  end

  # def validate_atr_variant_presence
  #
  #   return if persisted? && VariantAtrValue.where.not(id: id).where(variant_id: variant_id, atr_value_id: atr_value_id).exists?
  #
  #
  #   if VariantAtrValue.where(variant_id: variant_id, atr_value_id: atr_value_id).exists?
  #     errors.add(:Asset ,"Already assigned")
  #   end
  #
  #
  # end
end
