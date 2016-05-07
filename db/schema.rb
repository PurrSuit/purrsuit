# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160507174737) do

  create_table "achievements", force: :cascade do |t|
  end

  create_table "cabinet", force: :cascade do |t|
    t.string   "annex"
    t.integer  "id_dep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cabinets", force: :cascade do |t|
    t.string   "annex"
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deputies", force: :cascade do |t|
    t.integer "registration"
    t.string  "legislation_situation"
  end

  create_table "gamifications", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.string   "name"
    t.integer  "experience_points"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.integer  "uf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.string   "name"
    t.string   "gender"
    t.string   "email"
    t.string   "cpf"
    t.string   "age"
    t.integer  "uf_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "quests", force: :cascade do |t|
  end

  create_table "ufs", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "password_digest"
    t.integer "experience_points"
    t.boolean "role_admin"
  end

end
