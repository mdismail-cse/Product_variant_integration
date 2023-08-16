class CreateAtrValues < ActiveRecord::Migration[7.0]
  def change
    create_table :atr_values do |t|
      t.string :value
      t.references :atribute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
