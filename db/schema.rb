# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110601194413) do

  create_table "codes", :force => true do |t|
    t.text     "smell"
    t.integer  "language_id"
    t.integer  "denounce",    :default => 0
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "codes_vote_options", :id => false, :force => true do |t|
    t.integer "code_id"
    t.integer "vote_option_id"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vote_options", :force => true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
