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

ActiveRecord::Schema.define(version: 2018_10_13_173803) do

  create_table "activities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.integer "workforce_size", default: 0, null: false
    t.integer "work_hours", default: 0, null: false
    t.integer "strength", default: 0, null: false
    t.integer "industry_id"
    t.integer "state_id"
    t.integer "recruiter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_companies_on_industry_id"
    t.index ["recruiter_id"], name: "index_companies_on_recruiter_id"
    t.index ["state_id"], name: "index_companies_on_state_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobseeker_vacancies", force: :cascade do |t|
    t.integer "jobseeker_id"
    t.integer "vacancy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jobseeker_id"], name: "index_jobseeker_vacancies_on_jobseeker_id"
    t.index ["vacancy_id"], name: "index_jobseeker_vacancies_on_vacancy_id"
  end

  create_table "jobseekers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "location_id"
    t.integer "degree_id"
    t.integer "university_id"
    t.decimal "cgpa", precision: 4, scale: 2, null: false
    t.string "pref_size", null: false
    t.string "pref_hours", null: false
    t.integer "ref_status_1", default: 0
    t.integer "ref_status_2", default: 0
    t.integer "we1_id"
    t.integer "we2_id"
    t.integer "we3_id"
    t.integer "knowledge_score", null: false
    t.integer "skill_score", null: false
    t.integer "activity_score", null: false
    t.integer "top_knowledge_id"
    t.integer "top_skill_id"
    t.integer "top_activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_jobseekers_on_degree_id"
    t.index ["location_id"], name: "index_jobseekers_on_location_id"
    t.index ["top_activity_id"], name: "index_jobseekers_on_top_activity_id"
    t.index ["top_knowledge_id"], name: "index_jobseekers_on_top_knowledge_id"
    t.index ["top_skill_id"], name: "index_jobseekers_on_top_skill_id"
    t.index ["university_id"], name: "index_jobseekers_on_university_id"
    t.index ["we1_id"], name: "index_jobseekers_on_we1_id"
    t.index ["we2_id"], name: "index_jobseekers_on_we2_id"
    t.index ["we3_id"], name: "index_jobseekers_on_we3_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "company_temp", null: false
    t.integer "mobile", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "recruiter_id"
    t.integer "company_id"
    t.string "department", null: false
    t.integer "quantity", default: 0, null: false
    t.string "question_1"
    t.string "question_2"
    t.string "question_3"
    t.string "question_4"
    t.string "question_5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "q1_time"
    t.integer "q2_time"
    t.integer "q3_time"
    t.integer "q4_time"
    t.integer "q5_time"
    t.index ["company_id"], name: "index_vacancies_on_company_id"
    t.index ["recruiter_id"], name: "index_vacancies_on_recruiter_id"
  end

end
