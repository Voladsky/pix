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

ActiveRecord::Schema[7.1].define(version: 2023_11_06_212433) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_levels", force: :cascade do |t|
    t.string "title", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "photo_id", null: false
    t.index ["photo_id"], name: "index_comments_on_photo_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_favourites_on_photo_id"
    t.index ["user_id", "photo_id"], name: "index_favourites_on_user_id_and_photo_id", unique: true
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "management_rights", force: :cascade do |t|
    t.bigint "access_level_id", null: false
    t.bigint "user_id", null: false
    t.index ["access_level_id"], name: "index_management_rights_on_access_level_id"
    t.index ["user_id"], name: "index_management_rights_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text "description"
    t.text "as_url", null: false
    t.date "upload_date", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "tag_affiliations", force: :cascade do |t|
    t.bigint "photo_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id", "tag_id"], name: "index_tag_affiliations_on_photo_id_and_tag_id", unique: true
    t.index ["photo_id"], name: "index_tag_affiliations_on_photo_id"
    t.index ["tag_id"], name: "index_tag_affiliations_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_tags_on_content", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "nickname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "photos"
end
