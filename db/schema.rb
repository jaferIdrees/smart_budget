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

ActiveRecord::Schema[7.0].define(version: 2022_11_13_222113) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.bigint "author_id", null: false
    t.bigint "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_groups_on_author_id"
    t.index ["purchase_id"], name: "index_groups_on_purchase_id"
  end

  create_table "groups_purchases", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "purchase_id", null: false
    t.bigint "groups_id", null: false
    t.bigint "purchases_id", null: false
    t.index ["groups_id"], name: "index_groups_purchases_on_groups_id"
    t.index ["purchases_id"], name: "index_groups_purchases_on_purchases_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id", null: false
    t.index ["author_id"], name: "index_purchases_on_author_id"
    t.index ["group_id"], name: "index_purchases_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "groups", "purchases"
  add_foreign_key "groups", "users", column: "author_id"
  add_foreign_key "groups_purchases", "groups", column: "groups_id"
  add_foreign_key "groups_purchases", "purchases", column: "purchases_id"
  add_foreign_key "purchases", "groups"
  add_foreign_key "purchases", "users", column: "author_id"
end
