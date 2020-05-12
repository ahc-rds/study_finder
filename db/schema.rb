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

ActiveRecord::Schema.define(version: 2020_05_12_050148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "study_finder_condition_groups", id: :serial, force: :cascade do |t|
    t.integer "group_id"
    t.integer "condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_conditions", id: :serial, force: :cascade do |t|
    t.string "condition", limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_disease_sites", id: :serial, force: :cascade do |t|
    t.string "disease_site_name"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_finder_ds_trials", id: :serial, force: :cascade do |t|
    t.integer "disease_site_id"
    t.integer "trial_id"
  end

  create_table "study_finder_groups", id: :serial, force: :cascade do |t|
    t.string "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "children"
    t.boolean "adults"
    t.boolean "healthy_volunteers"
  end

  create_table "study_finder_locations", id: :serial, force: :cascade do |t|
    t.string "location", limit: 1000
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_parsers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "klass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_sites", id: :serial, force: :cascade do |t|
    t.string "site_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_finder_subgroups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_system_infos", id: :serial, force: :cascade do |t|
    t.string "initials"
    t.string "school_name"
    t.string "system_name"
    t.string "system_header"
    t.string "system_description", limit: 2000
    t.string "search_term"
    t.string "default_url"
    t.string "default_email"
    t.string "research_match_campaign"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "secret_key"
    t.string "google_analytics_id"
    t.boolean "display_all_locations"
    t.string "contact_email_suffix"
    t.text "researcher_description"
    t.boolean "captcha", default: false, null: false
    t.boolean "display_keywords", default: true
  end

  create_table "study_finder_trial_conditions", id: :serial, force: :cascade do |t|
    t.integer "trial_id"
    t.integer "condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["condition_id"], name: "condition_idx"
  end

  create_table "study_finder_trial_intervents", id: :serial, force: :cascade do |t|
    t.integer "trial_id"
    t.string "intervention_type"
    t.string "intervention"
    t.string "description", limit: 4000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_trial_keywords", id: :serial, force: :cascade do |t|
    t.integer "trial_id"
    t.string "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_trial_locations", id: :serial, force: :cascade do |t|
    t.integer "trial_id"
    t.integer "location_id"
    t.string "status"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "backup_last_name"
    t.string "backup_phone"
    t.string "backup_email"
    t.string "investigator_last_name"
    t.string "investigator_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_trial_mesh_terms", id: :serial, force: :cascade do |t|
    t.integer "trial_id"
    t.string "mesh_term_type"
    t.string "mesh_term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_trial_sites", id: :serial, force: :cascade do |t|
    t.integer "trial_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_finder_trials", id: :serial, force: :cascade do |t|
    t.string "system_id"
    t.string "brief_title", limit: 1000
    t.string "official_title", limit: 4000
    t.string "acronym"
    t.string "phase"
    t.string "overall_status"
    t.string "source", limit: 1000
    t.string "verification_date"
    t.text "brief_summary"
    t.text "detailed_description"
    t.string "gender"
    t.string "minimum_age"
    t.string "maximum_age"
    t.boolean "healthy_volunteers"
    t.string "simple_description", limit: 4000
    t.string "contact_override"
    t.boolean "visible"
    t.boolean "recruiting"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "contact_override_first_name"
    t.string "contact_override_last_name"
    t.integer "parser_id"
    t.string "official_last_name"
    t.string "official_first_name"
    t.string "official_role"
    t.string "official_affiliation"
    t.string "contact_last_name"
    t.string "contact_first_name"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "contact_backup_last_name"
    t.string "contact_backup_first_name"
    t.string "contact_backup_phone"
    t.string "contact_backup_email"
    t.text "eligibility_criteria"
    t.string "recruitment_url"
    t.string "min_age_unit"
    t.string "max_age_unit"
    t.string "lastchanged_date"
    t.string "firstreceived_date"
    t.boolean "reviewed"
    t.integer "featured", default: 0
    t.string "irb_number"
    t.string "cancer_yn"
    t.string "pi_name"
    t.string "pi_id"
  end

  create_table "study_finder_updaters", id: :serial, force: :cascade do |t|
    t.integer "parser_id"
    t.integer "num_updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "study_finder_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.string "internet_id", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_study_finder_users_on_email", unique: true
    t.index ["internet_id"], name: "index_study_finder_users_on_internet_id", unique: true
  end

  create_table "zip_centroids", force: :cascade do |t|
    t.string "zip", limit: 5
    t.decimal "lat", precision: 9, scale: 6
    t.decimal "long", precision: 9, scale: 6
  end

end
