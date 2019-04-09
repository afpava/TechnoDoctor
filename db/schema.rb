# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_12_195609) do

  create_table "brands", force: :cascade do |t|
    t.string "description"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_brands_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collaborators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "avatar"
    t.integer "user_id"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_customers_on_first_name"
    t.index ["last_name"], name: "index_customers_on_last_name"
    t.index ["phone_number"], name: "index_customers_on_phone_number"
  end

  create_table "devices", force: :cascade do |t|
    t.integer "model_id"
    t.string "serial_num"
    t.string "imei"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imei"], name: "index_devices_on_imei"
    t.index ["model_id"], name: "index_devices_on_model_id"
    t.index ["serial_num"], name: "index_devices_on_serial_num"
  end

  create_table "disrepares", force: :cascade do |t|
    t.string "description"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_disrepares_on_category_id"
  end

  create_table "disrepares_tickets", id: false, force: :cascade do |t|
    t.integer "disrepare_id", null: false
    t.integer "ticket_id", null: false
    t.index ["disrepare_id", "ticket_id"], name: "index_disrepares_tickets_on_disrepare_id_and_ticket_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "text"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "description"
    t.integer "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_models_on_brand_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "description"
    t.float "price"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_operations_on_category_id"
  end

  create_table "operations_tickets", id: false, force: :cascade do |t|
    t.integer "operation_id", null: false
    t.integer "ticket_id", null: false
    t.index ["operation_id", "ticket_id"], name: "index_operations_tickets_on_operation_id_and_ticket_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "description"
    t.float "price"
    t.integer "quantity"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_parts_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.float "orient_price"
    t.integer "prepayment"
    t.integer "stage", default: 0, null: false
    t.date "in_date"
    t.date "orient_date"
    t.integer "customer_id"
    t.integer "device_id"
    t.integer "collaborator_id"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collaborator_id"], name: "index_tickets_on_collaborator_id"
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
    t.index ["device_id"], name: "index_tickets_on_device_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "nickname"
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.date "birth_day"
    t.string "uid"
    t.string "provider"
    t.integer "customer_id"
    t.string "phone_number"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_users_on_customer_id"
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["phone_number"], name: "index_users_on_phone_number"
  end

end
