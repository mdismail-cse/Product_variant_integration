class CreateVariantAtrValues < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_atr_values do |t|
      t.references :variant, null: false, foreign_key: true
      t.references :atr_value, null: false, foreign_key: true

      t.timestamps
    end
  end
end
