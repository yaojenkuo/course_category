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

ActiveRecord::Schema.define(version: 20170807042631) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "length"
    t.string   "teacher"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "register_url"
    t.integer  "category_id"
    t.string   "course_img_file_name"
    t.string   "course_img_content_type"
    t.integer  "course_img_file_size"
    t.datetime "course_img_updated_at"
    t.integer  "teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.text     "experience"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "teacher_img_file_name"
    t.string   "teacher_img_content_type"
    t.integer  "teacher_img_file_size"
    t.datetime "teacher_img_updated_at"
  end

end
