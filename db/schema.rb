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

ActiveRecord::Schema.define(version: 20160926175147) do

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       null: false
    t.string   "phone",      null: false
    t.string   "token",      null: false
    t.string   "code",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_contacts_on_name", unique: true
    t.index ["phone"], name: "index_contacts_on_phone", unique: true
  end

  create_table "contacts_notifications", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "notification_id"
    t.index ["contact_id"], name: "index_contacts_notifications_on_contact_id"
    t.index ["notification_id"], name: "index_contacts_notifications_on_notification_id"
  end

  create_table "contacts_topics", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "topic_id"
    t.index ["contact_id"], name: "index_contacts_topics_on_contact_id"
    t.index ["topic_id"], name: "index_contacts_topics_on_topic_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "topic_id"
    t.string   "title"
    t.datetime "date"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "text"
    t.string   "link"
    t.text     "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "token"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
