# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_14_091642) do
  create_table "atr_values", force: :cascade do |t|
    t.string "value"
    t.integer "atribute_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atribute_id"], name: "index_atr_values_on_atribute_id"
  end

  create_table "atributes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_atributes", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "atribute_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atribute_id"], name: "index_product_atributes_on_atribute_id"
    t.index ["product_id"], name: "index_product_atributes_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variant_atr_values", force: :cascade do |t|
    t.integer "variant_id", null: false
    t.integer "atr_value_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atr_value_id"], name: "index_variant_atr_values_on_atr_value_id"
    t.index ["variant_id"], name: "index_variant_atr_values_on_variant_id"
  end

  create_table "variants", force: :cascade do |t|
    t.integer "price"
    t.integer "stock"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "atr_values", "atributes"
  add_foreign_key "product_atributes", "atributes"
  add_foreign_key "product_atributes", "products"
  add_foreign_key "variant_atr_values", "atr_values"
  add_foreign_key "variant_atr_values", "variants"
  add_foreign_key "variants", "products"
end
