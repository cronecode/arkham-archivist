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

ActiveRecord::Schema.define(version: 20170621163117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
    t.string "cycle"
  end

  create_table "deck_deltas", force: :cascade do |t|
    t.integer "investigator_id"
    t.integer "copies"
    t.string "card_name"
    t.string "preceding_scenario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investigators", force: :cascade do |t|
    t.string "name"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "physical_trauma", default: 0
    t.integer "mental_trauma", default: 0
    t.integer "experience_earned", default: 0
    t.integer "unspent_experience", default: 0
    t.text "deck_history"
  end

  create_table "scenarios", force: :cascade do |t|
    t.string "name"
    t.boolean "complete"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
    t.integer "victory_display"
    t.integer "resolution"
    t.integer "order"
  end

  add_foreign_key "deck_deltas", "investigators", name: "deck_deltas_investigator_id_fk"
  add_foreign_key "investigators", "campaigns", name: "investigators_campaign_id_fk"
  add_foreign_key "scenarios", "campaigns", name: "scenarios_campaign_id_fk"
end
