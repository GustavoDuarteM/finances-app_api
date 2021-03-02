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

ActiveRecord::Schema.define(version: 2021_03_02_091802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "monthly_operations", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.date "date_of_operation"
    t.integer "operation_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.bigint "recurring_operation_id"
    t.bigint "user_id", null: false
    t.index ["deleted_at"], name: "index_monthly_operations_on_deleted_at"
    t.index ["recurring_operation_id"], name: "index_monthly_operations_on_recurring_operation_id"
    t.index ["user_id"], name: "index_monthly_operations_on_user_id"
  end

  create_table "recurring_operations", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.date "starts_in"
    t.date "ends_in"
    t.integer "operation_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.bigint "users_id", null: false
    t.index ["deleted_at"], name: "index_recurring_operations_on_deleted_at"
    t.index ["users_id"], name: "index_recurring_operations_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "uid"
    t.string "name"
    t.string "image_url"
    t.string "token"
    t.integer "expires_at"
    t.string "refresh_token"
    t.boolean "expires"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "monthly_operations", "recurring_operations"
  add_foreign_key "monthly_operations", "users"
  add_foreign_key "recurring_operations", "users", column: "users_id"
end
