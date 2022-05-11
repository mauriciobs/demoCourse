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

ActiveRecord::Schema.define(version: 2022_05_10_235655) do

  create_table "books", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_has_books", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_course_has_books_on_book_id"
    t.index ["course_id"], name: "index_course_has_books_on_course_id"
  end

  create_table "courses", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reading_times", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.integer "times"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_reading_times_on_book_id"
    t.index ["user_id"], name: "index_reading_times_on_user_id"
  end

  create_table "roles", charset: "utf8mb3", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_has_courses", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_user_has_courses_on_course_id"
    t.index ["user_id"], name: "index_user_has_courses_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "course_has_books", "books", on_update: :cascade, on_delete: :cascade
  add_foreign_key "course_has_books", "courses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reading_times", "books", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reading_times", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_has_courses", "courses", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_has_courses", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "users", "roles", on_update: :cascade, on_delete: :cascade
end
