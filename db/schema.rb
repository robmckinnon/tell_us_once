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

ActiveRecord::Schema.define(:version => 20100320132437) do

  create_table "death_notifications", :force => true do |t|
    t.integer  "submitter_id"
    t.string   "relationship_to_deceased"
    t.string   "deceased_first_name"
    t.string   "deceased_family_name"
    t.string   "deceased_maiden_surname"
    t.date     "date_of_death"
    t.date     "date_of_birth"
    t.string   "place_of_birth"
    t.string   "national_insurance_number"
    t.string   "tax_reference_number"
    t.string   "nhs_number"
    t.text     "last_address"
    t.string   "last_postcode"
    t.boolean  "receiving_state_pension"
    t.string   "receiving_other_state_benefit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authenticity_token"
  end

  add_index "death_notifications", ["submitter_id"], :name => "index_death_notifications_on_submitter_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "department_notifications", :force => true do |t|
    t.integer  "submitter_id"
    t.string   "change_notification_type"
    t.integer  "change_notification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "department"
    t.datetime "processed_at"
  end

  create_table "submitters", :force => true do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.text     "address"
    t.string   "postcode"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
