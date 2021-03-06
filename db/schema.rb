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

ActiveRecord::Schema.define(:version => 20141122232549) do

  create_table "contact_messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contributions", :force => true do |t|
    t.integer "donor_id"
    t.integer "request_id"
    t.integer "resource_amount"
    t.string  "photo"
    t.boolean "tax_form_flag"
    t.date    "contribution_date"
    t.string  "pickupAddress"
    t.date    "pickup_start_date"
    t.date    "pickup_end_date"
    t.time    "pickup_start_time"
    t.time    "pickup_end_time"
    t.string  "pickup_number"
    t.boolean "pickup"
  end

  create_table "donors", :force => true do |t|
    t.string  "name"
    t.string  "city"
    t.string  "address"
    t.string  "phone_number"
    t.string  "email"
    t.string  "password"
    t.string  "security_question"
    t.string  "security_answer"
    t.string  "password_reset_token"
    t.string  "password_digest"
    t.boolean "verified"
  end

  create_table "organizations", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "city"
    t.string  "address"
    t.string  "operation_days"
    t.time    "opening_time"
    t.time    "closing_time"
    t.string  "phone_number"
    t.string  "email"
    t.string  "website_url"
    t.string  "linked_in_url"
    t.string  "facebook_url"
    t.string  "password"
    t.string  "security_question"
    t.string  "security_answer"
    t.string  "avatar"
    t.string  "password_reset_token"
    t.string  "password_digest"
    t.boolean "verified"
    t.string  "tax_id"
  end

  create_table "requests", :force => true do |t|
    t.integer "organization_id"
    t.string  "resource"
    t.integer "target_resource_count"
    t.integer "current_resource_count", :default => 0
    t.string  "address"
    t.string  "organization"
    t.string  "description"
    t.date    "start_date"
    t.date    "end_date"
    t.boolean "complete",               :default => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
