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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140617044122) do

  create_table "jumbleds", :force => true do |t|
    t.string   "category"
    t.string   "ans"
    t.string   "hint"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "newwordstables", :force => true do |t|
    t.string   "category"
    t.string   "ans"
    t.string   "hint"
    t.boolean  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "newwordstables", ["ans"], :name => "index_newwordstables_on_ans", :unique => true

  create_table "scorecards", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fruit"
    t.integer  "vegetable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "scorecards", ["user_id"], :name => "index_scorecards_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
