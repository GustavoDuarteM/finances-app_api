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

ActiveRecord::Schema.define(version: 2021_08_28_175509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "operations", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.date "date_of_operation"
    t.integer "operation_type"
    t.integer "operation_frequency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "recurring_operation_id"
    t.bigint "user_id", null: false
    t.index ["recurring_operation_id"], name: "index_operations_on_recurring_operation_id"
    t.index ["user_id"], name: "index_operations_on_user_id"
  end

  create_table "recurring_operations", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.date "starts_in"
    t.date "ends_in"
    t.integer "operation_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_recurring_operations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "token"
    t.integer "expires_at"
    t.string "refresh_token"
    t.boolean "expires"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "operations", "recurring_operations"
  add_foreign_key "operations", "users"
  add_foreign_key "recurring_operations", "users"
end
