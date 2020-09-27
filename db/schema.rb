# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_26_181105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pos_order", force: :cascade do |t|
    t.integer "res_partner_id"
    t.string "code"
    t.integer "total_price"
    t.integer "quantity"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pos_order_line", id: false, force: :cascade do |t|
    t.bigint "product_template_id", null: false
    t.bigint "pos_order_id", null: false
    t.integer "quantity"
    t.integer "price"
    t.integer "sub_total"
    t.index ["pos_order_id"], name: "index_pos_order_line_on_pos_order_id"
    t.index ["product_template_id"], name: "index_pos_order_line_on_product_template_id"
  end

  create_table "product_template", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "sku"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "res_partner", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.boolean "gender"
    t.float "point"
    t.date "date_of_birth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "voucher", force: :cascade do |t|
    t.integer "res_partner_id"
    t.string "code"
    t.string "description"
    t.date "expired_date"
    t.integer "pos_order_id"
  end

end
