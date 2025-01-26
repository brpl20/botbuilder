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

ActiveRecord::Schema[8.0].define(version: 2025_01_26_181500) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "ai_agents", force: :cascade do |t|
    t.string "name"
    t.text "persona"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ai_provider_id"
    t.bigint "ai_model_id"
    t.index ["ai_model_id"], name: "index_ai_agents_on_ai_model_id"
    t.index ["ai_provider_id"], name: "index_ai_agents_on_ai_provider_id"
  end

  create_table "ai_models", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "ai_provider_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ai_provider_id"], name: "index_ai_models_on_ai_provider_id"
    t.index ["name", "ai_provider_id"], name: "index_ai_models_on_name_and_ai_provider_id", unique: true
  end

  create_table "ai_providers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ai_providers_on_name", unique: true
  end

  create_table "instructions", force: :cascade do |t|
    t.text "content"
    t.bigint "ai_agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ai_agent_id"], name: "index_instructions_on_ai_agent_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "chat_id", null: false
    t.string "phone_number", null: false
    t.text "content", null: false
    t.string "message_type", null: false
    t.string "sender_type", null: false
    t.boolean "is_contact"
    t.bigint "ai_agent_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ai_agent_id"], name: "index_messages_on_ai_agent_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["phone_number"], name: "index_messages_on_phone_number"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "ai_agents", "ai_models"
  add_foreign_key "ai_agents", "ai_providers"
  add_foreign_key "ai_models", "ai_providers"
  add_foreign_key "instructions", "ai_agents"
  add_foreign_key "messages", "ai_agents"
  add_foreign_key "messages", "users"
  add_foreign_key "sessions", "users"
end
