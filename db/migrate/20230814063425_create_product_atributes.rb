class CreateProductAtributes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_atributes do |t|
      t.references :product, null: false, foreign_key: true
      t.references :atribute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
