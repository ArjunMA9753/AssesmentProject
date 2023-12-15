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

ActiveRecord::Schema.define(version: 20231215064747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"
  enable_extension "tablefunc"

  create_table "abandoned_carts", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "phone"
    t.text     "email"
    t.text     "items"
    t.text     "lead_name"
    t.integer  "amount"
    t.text     "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "status_updated_by"
    t.integer  "attempts",          default: 0
    t.text     "checkout_url"
    t.text     "order_status"
    t.json     "comments"
  end

  create_table "ach_plan", force: :cascade do |t|
    t.bigint   "package_type_id",  null: false
    t.jsonb    "ach_emi_criteria"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "achievement", force: :cascade do |t|
    t.bigint   "client_id"
    t.boolean  "is_active",                        default: true, null: false
    t.string   "image_url",           limit: 1024
    t.integer  "achievement_counter",                             null: false
    t.datetime "createdon",                                       null: false
    t.datetime "last_update",                                     null: false
    t.string   "achievement_value",   limit: 255
    t.bigint   "achievement_type_id"
  end

  create_table "achievement_type", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "type",        limit: 255
    t.integer  "priority"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "active_mobile_users", force: :cascade do |t|
    t.text   "device_id"
    t.bigint "client_id"
    t.string "client_status", limit: 100
    t.date   "notified_date"
  end

  create_table "activity", force: :cascade do |t|
    t.string   "topic",       limit: 32, null: false
    t.datetime "timestamp",              null: false
    t.integer  "user_id"
    t.string   "model",       limit: 16
    t.integer  "model_id"
    t.integer  "database_id"
    t.integer  "table_id"
    t.string   "custom_id",   limit: 48
    t.string   "details",                null: false
    t.index ["custom_id"], name: "idx_activity_custom_id", using: :btree
    t.index ["timestamp"], name: "idx_activity_timestamp", using: :btree
    t.index ["user_id"], name: "idx_activity_user_id", using: :btree
  end

  create_table "add_medicine_request", force: :cascade do |t|
    t.text     "medicine_name"
    t.text     "composition"
    t.bigint   "requested_by_client_id"
    t.boolean  "is_deleted"
    t.boolean  "is_added"
    t.datetime "createdon",              null: false
    t.datetime "last_update",            null: false
    t.text     "invalid_request_reason"
  end

  create_table "address", id: :bigint, force: :cascade do |t|
    t.string   "address_line1",    limit: 255
    t.string   "address_line2",    limit: 255
    t.string   "address_line3",    limit: 255
    t.string   "area",             limit: 255
    t.string   "latitude",         limit: 255
    t.string   "longitude",        limit: 255
    t.string   "city",             limit: 255
    t.string   "state",            limit: 35
    t.string   "pin_code",         limit: 255
    t.string   "fetched_pin_code", limit: 255
    t.string   "country",          limit: 27
    t.datetime "createdon",                    null: false
    t.datetime "last_update",                  null: false
  end

  create_table "agent_approval_credit", force: :cascade do |t|
    t.text     "reason"
    t.bigint   "agent_id",                                       null: false
    t.integer  "credit_available",                   default: 0
    t.datetime "last_recharged_at",                              null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "credit_available_to_give_approvals", default: 0
    t.index ["agent_id"], name: "agent_approval_credit_unique_agent_id", unique: true, using: :btree
  end

  create_table "agent_daily_activities", force: :cascade do |t|
    t.datetime "event_date"
    t.datetime "updated_at"
    t.json     "event_json"
    t.integer  "client_id"
  end

  create_table "agent_daily_stats", force: :cascade do |t|
    t.date     "report_date"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "working_hours"
    t.integer  "talktime"
    t.integer  "online_pending_task"
    t.integer  "online_completed_task"
    t.integer  "phone_pending_task"
    t.integer  "phone_completed_task"
    t.decimal  "on_time"
    t.integer  "consultations_done_25_mins"
    t.integer  "dialed_calls"
    t.integer  "connected_calls"
    t.integer  "spoken_calls_3_mins"
    t.integer  "email_send"
    t.integer  "sms_send"
    t.integer  "missed_ctc_calls"
    t.integer  "collection"
    t.integer  "avg_evaluation_score"
  end

  create_table "agent_ls_details", id: :bigserial, force: :cascade do |t|
    t.bigint   "agent_id",                                                             null: false
    t.string   "month_year"
    t.datetime "period_start_time",                                                    null: false
    t.datetime "period_end_time",                                                      null: false
    t.integer  "count_tasks_completed"
    t.integer  "count_tasks_missed"
    t.integer  "count_spoken_calls"
    t.integer  "total_talktime"
    t.integer  "count_referral_leads"
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.integer  "count_visits"
    t.integer  "total_connected_calls",                                default: 0
    t.integer  "calls_above_3min",                                     default: 0
    t.integer  "calls_above_5min",                                     default: 0
    t.decimal  "gross_revenue"
    t.boolean  "is_mom_today",                                         default: false
    t.decimal  "highest_approx_incentive_earned_till_date"
    t.decimal  "amount_above_approval_price_till_date"
    t.decimal  "amount_less_than_without_approval_price_till_date"
    t.decimal  "amount_below_approval_price_till_date"
    t.decimal  "platinum_amount_till_date"
    t.decimal  "referral_generated_amount_till_date"
    t.decimal  "incentive_above_approval_price_till_date"
    t.decimal  "incentive_less_than_without_approval_price_till_date"
    t.decimal  "incentive_below_approval_price_till_date"
    t.decimal  "platinum_incentive_till_date"
    t.decimal  "referral_generated_incentive_till_date"
    t.boolean  "performance_mail_sent_today",                          default: false
    t.index ["agent_id"], name: "index_agent_ls_details_on_agent_id", using: :btree
  end

  create_table "agent_sales_roles", force: :cascade do |t|
    t.bigint   "agent_id",      null: false
    t.bigint   "sales_role_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string   "name",                                                          null: false
    t.string   "email",                                                         null: false
    t.string   "password"
    t.integer  "centre_id",                                                     null: false
    t.boolean  "is_admin",                                      default: false, null: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.boolean  "has_billing_access",                            default: true
    t.boolean  "has_inventory_access",                          default: false
    t.bigint   "inventory_node_id"
    t.boolean  "is_active",                                     default: true
    t.integer  "employee_id"
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "has_audit_access",                              default: false
    t.integer  "sf_edit_access_level",                          default: 0
    t.boolean  "is_sales_person",                               default: false
    t.bigint   "app_user_id"
    t.string   "phone_no",                          limit: 255
    t.text     "vymo_name"
    t.text     "leadsquared_name"
    t.string   "city",                              limit: 20
    t.integer  "manager_id"
    t.string   "locus_name",                        limit: 50
    t.float    "start_lat"
    t.float    "start_lng"
    t.text     "leadsquared_user_id"
    t.boolean  "is_active_in_leadsquared",                      default: false
    t.integer  "serve_city_id"
    t.integer  "team_leader_id"
    t.bigint   "pincode"
    t.text     "address"
    t.bigint   "central_area_pincode"
    t.text     "ref_code"
    t.integer  "asst_team_leader_id"
    t.datetime "permanent_date"
    t.date     "deployment_date"
    t.text     "ls_phone_no"
    t.text     "role"
    t.text     "languages",                                                                  array: true
    t.text     "ctc_did"
    t.integer  "buddy_agent_id"
    t.integer  "trainer_id"
    t.text     "emp_code"
    t.text     "call_status"
    t.text     "dialer_did"
    t.boolean  "auto_ctc_enabled",                              default: false
    t.datetime "last_ctc_call"
    t.text     "ctc_logged_in_status"
    t.datetime "deactivated_date"
    t.datetime "joining_date"
    t.integer  "shift_timings"
    t.text     "skills",                                                                     array: true
    t.text     "cuisine",                                                                    array: true
    t.integer  "max_new_bookings",                              default: 12
    t.jsonb    "max_bookings"
    t.integer  "last_call_duration"
    t.text     "last_ctc_dialed_phone"
    t.integer  "today_ctc_disconnected_fast_count",             default: 0
    t.time     "last_auto_task_added_on"
    t.datetime "last_auto_task_added_at"
    t.text     "cities",                                                                     array: true
    t.integer  "talktime_target",                               default: 0
    t.integer  "working_hour_target",                           default: 0
  end

  create_table "agora_consultations", force: :cascade do |t|
    t.text     "lead_id"
    t.datetime "booked_on"
    t.datetime "consultation_time"
    t.integer  "client_id"
    t.datetime "start_time"
    t.text     "room_id"
    t.text     "channel_id"
    t.text     "url"
    t.integer  "duration"
    t.text     "status"
    t.integer  "agent_app_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_time"
    t.datetime "agent_joined"
    t.datetime "client_joined"
    t.text     "phone"
    t.integer  "ls_task_id"
    t.datetime "completed_on"
    t.text     "agent_email"
    t.text     "client_email"
    t.text     "resource_id"
    t.text     "recording_id"
  end

  create_table "allergies", id: :bigint, force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
  end

  create_table "alternate_schedule", id: :bigint, force: :cascade do |t|
    t.string   "from_time",                limit: 255
    t.string   "to_time",                  limit: 255
    t.datetime "date",                                 null: false
    t.bigint   "dietician_center_info_id"
    t.boolean  "is_leave"
    t.datetime "createdon",                            null: false
    t.datetime "last_update",                          null: false
    t.string   "from_break_time",          limit: 255
    t.string   "to_break_time",            limit: 255
    t.bigint   "applied_by_id"
    t.bigint   "app_user_id"
    t.boolean  "is_on_weekoff"
    t.boolean  "is_official_holiday"
    t.boolean  "is_in_training"
    t.boolean  "is_in_refresher_training"
    t.boolean  "is_absent"
    t.index ["app_user_id", "date"], name: "unique_auid_date", unique: true, using: :btree
    t.index ["dietician_center_info_id"], name: "ix_alternate_schedule_dietician_center_info_16", using: :btree
  end

  create_table "android_reg", id: :bigint, force: :cascade do |t|
    t.string   "key",                limit: 255
    t.bigint   "client_id",                                                                             null: false
    t.bigint   "app_user_id",                                                                           null: false
    t.datetime "createdon",                                                                             null: false
    t.datetime "last_update",                                                                           null: false
    t.string   "device_type",        limit: 50
    t.string   "app_version",        limit: 100
    t.string   "os_version",         limit: 100
    t.string   "device_model_name",  limit: 255
    t.string   "device_id",          limit: 255
    t.datetime "last_accessed",                  default: -> { "to_timestamp((0)::double precision)" }, null: false
    t.string   "advertiser_id",      limit: 255
    t.string   "kumulos_install_id", limit: 255
    t.text     "app_set_id"
    t.integer  "app_set_scope_id"
    t.index ["client_id"], name: "ix_android_reg_client_id_28", using: :btree
    t.index ["key"], name: "unique_key", unique: true, using: :btree
  end

  create_table "answer", id: :bigint, force: :cascade do |t|
    t.integer  "question_id",                          null: false
    t.text     "answer",                               null: false
    t.bigint   "client_id",                            null: false
    t.datetime "createdon",   default: -> { "now()" }, null: false
    t.datetime "last_update", default: -> { "now()" }, null: false
    t.datetime "logged_at"
    t.date     "for_date"
    t.index ["client_id"], name: "idx_answer_0", using: :btree
    t.index ["question_id"], name: "idx_answer", using: :btree
  end

  create_table "app_consultations", force: :cascade do |t|
    t.text     "lead_id"
    t.datetime "booked_on"
    t.datetime "booked_for"
    t.text     "consultation_type"
    t.boolean  "consultation_done"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "done_on"
  end

  create_table "app_content", force: :cascade do |t|
    t.text     "title"
    t.string   "category",      limit: 100
    t.string   "sub_category",  limit: 100
    t.integer  "order_seq"
    t.text     "url"
    t.text     "thumbnail_url"
    t.datetime "show_on_date"
    t.datetime "createdon"
    t.datetime "last_update"
    t.text     "diseases"
  end

  create_table "app_file_content", force: :cascade do |t|
    t.text     "category"
    t.text     "sub_category"
    t.text     "file_url"
    t.text     "thumbnail_url"
    t.text     "topic"
    t.integer  "duration"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "app_file_tracker", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "app_file_content_id"
    t.integer  "played_duration"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "app_file_tracker_logger", force: :cascade do |t|
    t.integer  "client_id",          null: false
    t.integer  "content_id",         null: false
    t.integer  "total_video_played", null: false
    t.integer  "diff_played",        null: false
    t.date     "log_date",           null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "app_search_suggestion", force: :cascade do |t|
    t.text "suggestions"
  end

  create_table "app_usage_report", id: :bigint, force: :cascade do |t|
    t.datetime "date"
    t.bigint   "active_clients_login_count"
    t.bigint   "no_of_sessions"
    t.bigint   "no_of_finish_days"
    t.bigint   "no_of_active_food_logs"
    t.bigint   "no_of_food_ratings"
    t.bigint   "not_installed_app"
    t.bigint   "no_of_android_users"
    t.bigint   "no_of_ios_users"
    t.bigint   "no_of_feedbacks_given"
    t.bigint   "no_of_food_sugg_given"
    t.bigint   "no_of_blogs_visited_by_active"
    t.bigint   "no_of_weighings"
    t.text     "no_of_active_client_chats"
    t.bigint   "trial_clients_login_count"
    t.bigint   "no_of_trial_sessions"
    t.bigint   "no_of_appt_served_for_trial"
    t.bigint   "no_of_diet_scores_given"
    t.bigint   "no_of_clients_have_package_interest"
    t.bigint   "no_of_requests_for_sample_kit"
    t.text     "no_of_trial_client_chats"
    t.bigint   "no_of_trial_diet_logs"
    t.bigint   "no_of_blogs_visited_by_trial"
    t.bigint   "second_day_visit_count"
    t.datetime "createdon",                                       null: false
    t.datetime "last_update",                                     null: false
    t.integer  "no_of_booked_appointments",           default: 0
    t.integer  "no_of_packages_bought",               default: 0
  end

  create_table "app_user", id: :bigint, force: :cascade do |t|
    t.binary   "photo"
    t.string   "first_name",            limit: 255
    t.string   "last_name",             limit: 255
    t.string   "gender",                limit: 6
    t.string   "email",                 limit: 255
    t.string   "phone_no",              limit: 255
    t.text     "password"
    t.text     "salt"
    t.datetime "dob"
    t.string   "marital_status",        limit: 7
    t.string   "role",                  limit: 30
    t.datetime "createdon",                                        null: false
    t.datetime "last_update",                                      null: false
    t.datetime "last_password_updated"
    t.boolean  "email_confirmed",                   default: true
    t.text     "location"
    t.string   "photo_url",             limit: 256
    t.integer  "country_code",                      default: 91
    t.string   "phone_no2",             limit: 255
    t.integer  "country_code2",                     default: 91
    t.bigint   "telephony_did"
    t.text     "telephony_ip"
    t.datetime "last_log_in_time"
    t.text     "jwt_auth_token"
    t.text     "tribe_email"
    t.text     "apple_id"
    t.boolean  "is_account_deleted"
    t.index ["email"], name: "app_user_role", unique: true, where: "(((role)::text <> 'CLIENT'::text) AND (createdon > '2017-08-02 15:50:00'::timestamp without time zone))", using: :btree
    t.index ["id"], name: "ix_master_diet_plan_10", using: :btree
    t.index ["telephony_did"], name: "unique_telephony_did", unique: true, using: :btree
  end

  create_table "app_user_reg", force: :cascade do |t|
    t.string   "key",               limit: 255
    t.bigint   "app_user_id",                                                                          null: false
    t.datetime "createdon",                                                                            null: false
    t.datetime "last_update",                                                                          null: false
    t.string   "device_type",       limit: 50
    t.string   "app_version",       limit: 100
    t.string   "os_version",        limit: 100
    t.string   "device_model_name", limit: 255
    t.string   "device_id",         limit: 255
    t.datetime "last_accessed",                 default: -> { "to_timestamp((0)::double precision)" }, null: false
    t.index ["key"], name: "app_user_reg_unique_key", unique: true, using: :btree
  end

  create_table "app_user_version_check", primary_key: ["platform", "app_version"], force: :cascade do |t|
    t.serial   "id",                                           null: false
    t.string   "platform",          limit: 20,                 null: false
    t.string   "app_version",       limit: 20,                 null: false
    t.boolean  "upgrade_available",            default: false, null: false
    t.boolean  "force_upgrade",                default: false, null: false
    t.datetime "createdon",                                    null: false
    t.datetime "last_update",                                  null: false
  end

  create_table "app_video_blog", force: :cascade do |t|
    t.text     "url"
    t.text     "title"
    t.text     "thumbnail_url"
    t.text     "content_name"
    t.text     "content_type"
    t.text     "category"
    t.integer  "duration"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "app_video_blog_tracker", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "app_video_blog_id"
    t.integer  "played_duration"
    t.text     "event_type"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "appointment", id: :bigint, force: :cascade do |t|
    t.bigint   "requested_by_id",                                       null: false
    t.bigint   "requested_to_id",                                       null: false
    t.bigint   "appointment_type_id",                                   null: false
    t.text     "reason"
    t.string   "appointment_status",        limit: 9
    t.datetime "booked_on"
    t.datetime "appointment_time"
    t.datetime "createdon",                                             null: false
    t.datetime "last_update",                                           null: false
    t.bigint   "cancelled_by_id"
    t.datetime "cancel_time"
    t.text     "reason_for_cancel"
    t.bigint   "feedback_id"
    t.bigint   "created_by_id"
    t.text     "comment_for_serving"
    t.string   "appointment_creation_type", limit: 255
    t.integer  "productivity"
    t.string   "minute_slot",               limit: 10
    t.boolean  "is_moved_from_yesterday",               default: false
    t.string   "call_type",                 limit: 32
    t.bigint   "requested_doctor_id"
    t.index ["appointment_type_id"], name: "ix_appointment_appointmenttype_2", using: :btree
    t.index ["requested_by_id"], name: "ix_appointment_requestedby_2", using: :btree
    t.index ["requested_to_id"], name: "ix_appointment_requestedto_2", using: :btree
  end

  create_table "appointment_booking_payments", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "phone"
    t.text     "transaction_id"
    t.datetime "payment_date"
    t.text     "status"
    t.text     "lead_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at"
  end

  create_table "appointment_feedback", id: :bigint, force: :cascade do |t|
    t.text     "weight_loss_reason"
    t.string   "status",                  limit: 255
    t.text     "positive"
    t.integer  "follow_program_scale"
    t.text     "other_feedback"
    t.text     "education_topic"
    t.datetime "createdon",                                                    null: false
    t.datetime "last_update",                                                  null: false
    t.text     "not_follow_reason"
    t.text     "exercies_detail"
    t.text     "not_like"
    t.text     "is_taking_supplement"
    t.text     "diet_snap"
    t.text     "comfortable"
    t.text     "food_log_reason"
    t.decimal  "weight",                              precision: 10, scale: 2
    t.string   "discuss_about_ref",       limit: 6
    t.string   "comment_about_ref",       limit: 255
    t.string   "appointment_checklist"
    t.text     "possible_community"
    t.text     "symptoms_feedback"
    t.text     "medication_feedback"
    t.text     "lab_report_feedback"
    t.text     "monthly_review_feedback"
    t.text     "family_history_feedback"
  end

  create_table "appointment_type", id: :bigint, default: -> { "nextval('appointment_type_seq'::regclass)" }, force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "minutes"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "approval_types", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "approval_type"
  end

  create_table "approvals", force: :cascade do |t|
    t.string   "phone_no",                      null: false
    t.string   "lead_id",                       null: false
    t.bigint   "given_by_agent_id"
    t.bigint   "sales_agent_id"
    t.date     "given_date"
    t.integer  "validity",          default: 7
    t.integer  "approval_type_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "reason",                        null: false
    t.bigint   "bill_id"
    t.string   "month_kit_code"
    t.integer  "min_bill_amount"
    t.integer  "package_type_id"
    t.text     "bill_type"
    t.text     "mode_of_payment"
  end

  create_table "approve_wrong_referral", force: :cascade do |t|
    t.bigint   "approved_by"
    t.datetime "approved_date"
    t.bigint   "bill_id"
    t.datetime "createdon",        null: false
    t.datetime "last_update",      null: false
    t.text     "approved_comment"
    t.boolean  "approved"
    t.bigint   "feedback_id"
  end

  create_table "assign_diet_plan_alt_data", id: :bigint, force: :cascade do |t|
    t.bigint "assign_diet_plans_id"
    t.bigint "meal_time_id"
    t.bigint "food_id"
    t.float  "qty"
    t.bigint "column_index"
    t.bigint "row_index"
    t.string "selected_unit",        limit: 50
    t.index ["assign_diet_plans_id"], name: "assign_diet_plan_alt_data_index_plan_id", using: :btree
  end

  create_table "assign_diet_plan_data", id: :bigint, force: :cascade do |t|
    t.bigint "assign_diet_plans_id"
    t.bigint "meal_time_id"
    t.bigint "food_id"
    t.float  "qty"
    t.string "selected_unit",        limit: 50
    t.index ["assign_diet_plans_id"], name: "assign_diet_plan_data_index_plan_id", using: :btree
  end

  create_table "assign_diet_plans", id: :bigint, force: :cascade do |t|
    t.bigint "assign_dietcharts_id",                                null: false
    t.string "diet_chart_type",      limit: 20, default: "REGULAR"
    t.index ["assign_dietcharts_id"], name: "assign_diet_plans_index_chart", using: :btree
    t.index ["id"], name: "ix_assign_dietcharts_id_fkey", using: :btree
  end

  create_table "assign_dietcharts", id: :bigint, force: :cascade do |t|
    t.bigint   "diet_phase_id",                            null: false
    t.bigint   "client_id",                                null: false
    t.datetime "createdon"
    t.datetime "last_update"
    t.bigint   "updated_by_id"
    t.text     "internal_commets"
    t.text     "notes_to_client"
    t.integer  "rate_on_scale"
    t.datetime "start_date",                               null: false
    t.datetime "end_date",                                 null: false
    t.string   "chart_type",                    limit: 10
    t.text     "reason_for_no_weekly_detox"
    t.integer  "no_of_customization"
    t.text     "plan_customize_commets"
    t.text     "food_month_kit_not_diet_chart"
    t.text     "food_diet_chart_not_month_kit"
    t.text     "food_add_sugg"
    t.string   "month_kit_id",                  limit: 10
    t.string   "month_kit_code",                limit: 10
    t.text     "food_remove_sugg"
    t.text     "supplement_sugg"
    t.index ["client_id"], name: "assign_dietcharts_client_id", using: :btree
    t.index ["end_date"], name: "assign_dietcharts_date2", using: :btree
    t.index ["start_date"], name: "assign_dietcharts_date1", using: :btree
  end

  create_table "auto_call_enable", id: false, force: :cascade do |t|
    t.bigint "app_user_id"
  end

  create_table "auto_call_info", id: false, force: :cascade do |t|
    t.bigserial "id",                           null: false
    t.bigint    "caller_phone_no"
    t.string    "callee_email",     limit: 256
    t.string    "message",          limit: 256
    t.integer   "priority"
    t.string    "status",           limit: 32
    t.datetime  "appointment_time"
    t.datetime  "createdon",                    null: false
    t.datetime  "last_update",                  null: false
  end

  create_table "auto_ctc_trackings", force: :cascade do |t|
    t.text     "phone"
    t.text     "lead_id"
    t.integer  "ls_task_id"
    t.integer  "agent_id"
    t.boolean  "dialed"
    t.boolean  "spoken"
    t.boolean  "agent_not_picked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "automated_reminder_calls", force: :cascade do |t|
    t.text     "campaign_name"
    t.text     "telephony_campaign_id"
    t.text     "lead_id"
    t.integer  "duration"
    t.text     "phone"
    t.text     "status"
    t.datetime "call_time"
    t.integer  "selected_option"
    t.text     "selected_option_description"
    t.integer  "consultation_lead_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ls_task_id"
  end

  create_table "backup_health_dollar_26_april", id: false, force: :cascade do |t|
    t.bigint   "id",                                     null: false
    t.bigint   "client_id",                              null: false
    t.decimal  "credit",        precision: 10, scale: 2, null: false
    t.decimal  "spent",         precision: 10, scale: 2, null: false
    t.decimal  "saved",         precision: 10, scale: 2
    t.decimal  "earned",        precision: 10, scale: 2, null: false
    t.boolean  "is_finish_day",                          null: false
    t.decimal  "balance",       precision: 10, scale: 2
    t.date     "date",                                   null: false
    t.datetime "createdon",                              null: false
    t.datetime "last_update",                            null: false
  end

  create_table "backup_updated_bills", id: false, force: :cascade do |t|
    t.integer  "id"
    t.integer  "client_id"
    t.date     "old_exp_date"
    t.date     "expiry_date"
    t.datetime "last_update"
  end

  create_table "belly_fat_quiz", force: :cascade do |t|
    t.bigint   "client_id",                     null: false
    t.datetime "createdon",                     null: false
    t.datetime "last_update",                   null: false
    t.bigint   "quiz_questions_id",             null: false
    t.string   "answer",            limit: 255
    t.boolean  "is_correct"
  end

  create_table "bills", force: :cascade do |t|
    t.string   "lead_id",                                                                       null: false
    t.integer  "client_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "package_type_id",                                                               null: false
    t.integer  "centre_id",                                                                     null: false
    t.date     "purchase_date"
    t.date     "activation_date"
    t.date     "expiry_date"
    t.string   "status",                                               default: "BOUGHT",       null: false
    t.integer  "agent_id",                                                                      null: false
    t.integer  "actual_food_amount",                                                            null: false
    t.integer  "actual_wellness_amount",                                                        null: false
    t.integer  "freeze_days_claimed",                                  default: 0,              null: false
    t.text     "comments"
    t.datetime "createdon",                                            default: -> { "now()" }, null: false
    t.datetime "last_update",                                          default: -> { "now()" }, null: false
    t.datetime "billing_date",                                                                  null: false
    t.string   "referred_type"
    t.integer  "referred_by"
    t.string   "bill_type"
    t.string   "lead_source"
    t.string   "assigned_by",                              limit: 255
    t.date     "assigned_date"
    t.bigint   "disease_ids",                                                                                array: true
    t.string   "detox_kit_given"
    t.text     "remarked"
    t.text     "remarked_by"
    t.date     "remarked_date"
    t.string   "status_value",                             limit: 255
    t.bigint   "status_change_by_id"
    t.date     "status_change_date"
    t.string   "reason",                                   limit: 255
    t.bigint   "reason_change_by_id"
    t.date     "reason_change_date"
    t.integer  "detox_kit_inv_node"
    t.string   "update_log"
    t.string   "country_name"
    t.date     "detox_kit_given_date"
    t.string   "cancel_reason"
    t.bigint   "country_code",                                         default: 91
    t.date     "cancel_date"
    t.date     "expected_date_for_next_payment"
    t.date     "old_expiry_date"
    t.text     "reason_for_changing"
    t.text     "due_log",                                                                                    array: true
    t.boolean  "is_downgraded",                                        default: false
    t.decimal  "downgrade_written_off_amount",                         default: "0.0"
    t.decimal  "previous_package_amount",                              default: "0.0"
    t.text     "cuisine_pref"
    t.text     "language_prefs",                                                                             array: true
    t.boolean  "is_jain",                                              default: false
    t.integer  "shake_flavor_pref"
    t.text     "english_comfort"
    t.boolean  "is_upgraded",                                          default: false
    t.bigint   "upgraded_from_bill_id"
    t.decimal  "client_weight"
    t.decimal  "client_height"
    t.date     "client_dob"
    t.decimal  "client_fat_percent"
    t.decimal  "client_muscle_percent"
    t.decimal  "client_bmr"
    t.bigint   "otp_entered"
    t.boolean  "otp_verified",                                         default: false
    t.string   "non_otp_reason"
    t.string   "visit_type"
    t.bigint   "due_penalty_ids",                                                                            array: true
    t.string   "ls_first_name"
    t.string   "ls_last_name"
    t.string   "ls_email"
    t.datetime "next_call_to_client_for_referral_renewal"
    t.text     "counselor_status"
    t.bigint   "counselor_status_change_by_id"
    t.datetime "counselor_status_change_date"
    t.boolean  "is_shopify_bill",                                      default: false
    t.date     "refund_date"
    t.string   "ls_main_intermediate_source"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_city"
    t.bigint   "address_postal_code"
    t.string   "address_state"
    t.string   "referred_by_email"
    t.string   "referred_by_employee_email"
    t.string   "referrer_id"
    t.boolean  "referral_voucher_sent",                                default: false
    t.boolean  "is_couple_group_package",                              default: false
    t.text     "referral_voucher_code"
    t.bigint   "client_occupation_id"
    t.string   "delayed_sf_job_id"
    t.string   "referred_by_client_phone"
    t.bigint   "related_offered_bill_id"
    t.string   "subscribed_package_category"
    t.integer  "lead_bmi"
    t.boolean  "is_vip",                                               default: false
    t.boolean  "couple_package_valid",                                 default: false
    t.string   "couple_phone"
    t.string   "vip_reason"
    t.string   "no_platinum_reason"
    t.bigint   "allergy_ids",                                                                                array: true
    t.boolean  "referral_mail1_sent",                                  default: false
    t.boolean  "referral_mail2_sent",                                  default: false
    t.boolean  "referral_voucher_to_be_given",                         default: false
    t.string   "referral_voucher_sent_status"
    t.string   "mode_of_payment"
    t.text     "transferred_details"
    t.string   "coupon_code_text"
    t.integer  "client_visceral_fat"
    t.date     "by_when_conducting_visit"
    t.decimal  "client_referral_lead_count"
    t.decimal  "client_company_strength"
    t.string   "is_client_open_to_conducting_visit",       limit: 50
    t.string   "conducting_visit_detailed_comments"
    t.string   "client_designation"
    t.string   "client_company"
    t.string   "names_of_referral_leads"
    t.string   "why_no_referral_leads"
    t.integer  "pending_email_sms_alert_sent_count",                   default: 0
    t.boolean  "make_bill_active_again",                               default: false
    t.boolean  "renewal_with_detox",                                   default: false
    t.string   "client_buddy_name"
    t.string   "client_buddy_relation"
    t.string   "client_buddy_mobile"
    t.string   "client_buddy_email"
    t.bigint   "client_buddy_occupation_id"
    t.string   "client_buddy_designation"
    t.string   "client_doc_name"
    t.string   "client_doc_type"
    t.string   "client_hospital_name"
    t.string   "client_doc_mob"
    t.string   "client_no_of_flats_in_apt"
    t.integer  "no_of_ach_emis",                                       default: 0
    t.boolean  "is_ach_emis",                                          default: false
    t.text     "tnc_text"
    t.string   "subscribed_subpackage_category"
    t.bigint   "sold_by_agent_id"
    t.bigint   "program_details_id"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.string   "utm_medium"
    t.string   "utm_source"
    t.text     "rnr_sales_agent_transferred_details"
    t.bigint   "current_rnr_sales_agent_id"
    t.string   "dsa_partner"
    t.decimal  "client_creatinine"
    t.date     "member_met_date"
    t.boolean  "is_activation_confirm"
    t.bigint   "activation_confirm_by_id"
    t.string   "reason_for_cheque"
    t.boolean  "cheque_permitted"
    t.string   "payment_comment"
    t.date     "actual_activation_date"
    t.text     "gst_package_name"
    t.integer  "refund_value"
    t.text     "client_gst_number"
    t.integer  "video_course_watched_perc"
    t.boolean  "is_ecommerce_bill",                                    default: false
    t.boolean  "referral_250voucher_used",                             default: false
    t.text     "course_name"
    t.text     "languages"
    t.date     "maintanence_start_date"
    t.date     "maintanence_end_date"
    t.integer  "active_month_kit_count"
    t.text     "bill_no"
    t.text     "gender"
    t.text     "pricing_comments"
    t.text     "thyrocare_appoinment_time"
    t.text     "thyrocare_lead_id"
    t.text     "wdr_transform_dieseases"
    t.boolean  "package_voucher_sent"
    t.text     "package_voucher_code",                                                                       array: true
    t.date     "package_voucher_sent_date"
    t.integer  "cancel_by_id"
    t.text     "ad_name"
    t.integer  "sugg_purchased_items",                                                                       array: true
    t.jsonb    "sugg_data"
    t.text     "no_emi_reason"
    t.index ["agent_id"], name: "index_bills_on_agent_id", using: :btree
    t.index ["lead_id"], name: "index_bills_on_lead_id", using: :btree
  end

  create_table "bills_backup", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "client_id"
    t.date    "activation_date"
    t.date    "expiry_date"
  end

  create_table "call_feedback_ratings", force: :cascade do |t|
    t.text     "phone"
    t.integer  "rating"
    t.text     "comments"
    t.text     "rating_for"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_settings", force: :cascade do |t|
    t.text     "key"
    t.jsonb    "value"
    t.datetime "created_at"
    t.datetime "update_at"
    t.datetime "updated_at"
  end

  create_table "campaign_activity_histories", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "removed_ids", array: true
    t.integer  "added_ids",   array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_infos", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "shift",       array: true
    t.integer  "app_user_id"
    t.integer  "added_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agent_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.text     "name"
    t.text     "roles",                      array: true
    t.integer  "team_size"
    t.integer  "created_by"
    t.boolean  "is_active",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_label", force: :cascade do |t|
    t.integer "card_id",  null: false
    t.integer "label_id", null: false
    t.index ["card_id", "label_id"], name: "unique_card_label_card_id_label_id", unique: true, using: :btree
    t.index ["card_id"], name: "idx_card_label_card_id", using: :btree
    t.index ["label_id"], name: "idx_card_label_label_id", using: :btree
  end

  create_table "center_coordinator", id: :bigint, force: :cascade do |t|
    t.bigint   "app_user_id"
    t.string   "experience",  limit: 255
    t.text     "company"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
    t.bigint   "centre_id"
  end

  create_table "center_targets", force: :cascade do |t|
    t.integer  "center_id",                              null: false
    t.string   "month_year"
    t.bigint   "target"
    t.date     "entry_date",    default: -> { "now()" }
    t.bigint   "target_set_by"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "centre", id: :bigint, force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "contact_person_name", limit: 255
    t.string   "contact_number",      limit: 255
    t.text     "description"
    t.bigint   "address_id"
    t.datetime "createdon",                                                                null: false
    t.datetime "last_update",                                                              null: false
    t.string   "service_tax_no",      limit: 255
    t.string   "full_name",           limit: 255
    t.string   "tin_no",              limit: 255
    t.string   "state",               limit: 255
    t.text     "centre_address"
    t.decimal  "service_tax_rate",                precision: 10, scale: 2
    t.decimal  "vat_tax_rate",                    precision: 10, scale: 2
    t.boolean  "is_ol",                                                    default: false
    t.boolean  "is_active",                                                default: true
    t.bigint   "inventory_node_id"
    t.boolean  "is_sales_centre",                                          default: false
    t.boolean  "is_dietitian_centre",                                      default: false
    t.boolean  "is_home_centre",                                           default: false
  end

  create_table "challenge", force: :cascade do |t|
    t.datetime "createdon",                  null: false
    t.datetime "last_update",                null: false
    t.string   "challenge_type", limit: 100
    t.string   "title",          limit: 255
    t.text     "description"
    t.integer  "order_seq"
    t.bigint   "discussion_id"
  end

  create_table "challenge_activity", force: :cascade do |t|
    t.datetime "createdon",                    null: false
    t.datetime "last_update",                  null: false
    t.bigint   "challenge_id"
    t.string   "activity_name",    limit: 100
    t.text     "activity_options"
    t.bigint   "coin_type_id"
  end

  create_table "challenge_points", force: :cascade do |t|
    t.string  "name",   null: false
    t.integer "value"
    t.string  "course"
  end

  create_table "channel_cost_spent_details", force: :cascade do |t|
    t.string   "channel_name",                      null: false
    t.decimal  "cost_spent",        default: "0.0"
    t.date     "for_date",                          null: false
    t.string   "month_year"
    t.bigint   "added_by_agent_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["channel_name", "for_date"], name: "unique_key_channel_cost_spent_details", unique: true, using: :btree
  end

  create_table "chat", id: :bigint, force: :cascade do |t|
    t.bigint   "commented_by_id"
    t.bigint   "commented_to_id"
    t.boolean  "reply_expected",  default: false
    t.string   "message"
    t.text     "url"
    t.datetime "comment_date"
    t.datetime "createdon",                       null: false
    t.datetime "last_update",                     null: false
    t.bigint   "entity_id"
    t.boolean  "is_visible",      default: true
    t.boolean  "is_automate",     default: false
    t.text     "metadata"
    t.bigint   "client_id"
    t.boolean  "read_status"
    t.text     "type"
    t.index ["client_id"], name: "idx_client_id", using: :btree
    t.index ["commented_by_id"], name: "ix_chat_commentedby_8", using: :btree
    t.index ["commented_to_id"], name: "ix_chat_commentedto_8", using: :btree
  end

  create_table "chat_messages", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "phone"
    t.integer  "visit_id"
    t.json     "chat"
    t.boolean  "read_status"
    t.datetime "chat_update_time"
    t.datetime "created_at",           null: false
    t.datetime "updated_at"
    t.text     "chat_type"
    t.datetime "first_lead_chat_time"
    t.integer  "agent_id"
    t.text     "service_provider"
  end

  create_table "chat_notification", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "dietician_id"
    t.string   "type",              limit: 100
    t.bigint   "chat_id"
    t.datetime "createdon",                                    null: false
    t.datetime "last_update",                                  null: false
    t.boolean  "is_manual_trigger",             default: true
    t.bigint   "sent_by_id"
    t.bigint   "priority_id"
    t.index ["chat_id"], name: "ix_chat_notification_chat_28", using: :btree
    t.index ["client_id"], name: "ix_chat_notification_client_28", using: :btree
  end

  create_table "chat_notification_priority", id: :bigint, force: :cascade do |t|
    t.string  "notification_type",     limit: 255
    t.string  "notification_msg_type", limit: 255
    t.integer "msg_order"
  end

  create_table "city_states", force: :cascade do |t|
    t.text     "city"
    t.text     "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client", id: :bigint, force: :cascade do |t|
    t.text     "status"
    t.string   "assignuser",                    limit: 255
    t.float    "initial_weight"
    t.float    "total_weight_loss"
    t.decimal  "height",                                    precision: 10, scale: 2
    t.float    "bmi"
    t.float    "bmr"
    t.float    "fat"
    t.float    "muscle"
    t.integer  "bodyage"
    t.bigint   "client_occupation_id"
    t.string   "involve_in_travel",             limit: 255
    t.string   "hoursofsleep",                  limit: 14
    t.datetime "starting_date"
    t.bigint   "app_user_id"
    t.bigint   "medical_history_id"
    t.bigint   "weight_history_id"
    t.bigint   "food_drink_info_id"
    t.text     "search_index"
    t.integer  "weight_tracker_range_in_days"
    t.float    "over_all_weight_loss"
    t.datetime "last_wtmeasurement_date"
    t.float    "last_measured_weight"
    t.datetime "createdon",                                                                          null: false
    t.datetime "last_update",                                                                        null: false
    t.boolean  "password_change",                                                    default: false
    t.bigint   "client_motivation_id"
    t.string   "profile_status",                limit: 255
    t.bigint   "diet_recall_id"
    t.integer  "health_dollars_budget"
    t.bigint   "current_package_id"
    t.text     "children"
    t.integer  "is_wizard_complete",            limit: 2
    t.datetime "wizard_createdon"
    t.datetime "wizard_last_updated"
    t.boolean  "sample_kit_requested",                                               default: false, null: false
    t.boolean  "diet_scoring_done",                                                  default: false, null: false
    t.bigint   "client_additional_data_id"
    t.boolean  "interested_in_buying",                                               default: false, null: false
    t.boolean  "was_trial",                                                          default: false, null: false
    t.text     "app_trail_interest"
    t.text     "courier_status"
    t.bigint   "courier_updated_by_id"
    t.bigint   "interest_updated_by_id"
    t.bigint   "courier_status_updated_by_id"
    t.datetime "interest_update_on"
    t.datetime "courier_update_on"
    t.datetime "courier_status_update_on"
    t.datetime "last_sync_timestamp"
    t.datetime "last_dietlog_sync_timestamp"
    t.datetime "last_food_db_sync_timestamp"
    t.text     "referrer_id"
    t.float    "expected_amount"
    t.bigint   "expected_amount_updated_by_id"
    t.datetime "expected_amount_updated_at"
    t.text     "home_visit_status"
    t.integer  "can_use_app",                   limit: 2
    t.string   "lead_id"
    t.bigint   "source_centre_id"
    t.text     "preferred_language"
    t.decimal  "total_score",                               precision: 10, scale: 2
    t.integer  "current_primary_bill_id"
    t.integer  "active_days"
    t.decimal  "profile_completion_percentage",             precision: 10, scale: 2
    t.text     "vita_access_token"
    t.date     "initial_weight_date"
    t.text     "debug_message"
    t.boolean  "is_pledge_done"
    t.integer  "best_day_to_reach"
    t.integer  "best_time_to_reach"
    t.string   "relative_phone",                limit: 255
    t.string   "relation_with_the_person",      limit: 255
    t.string   "relative_name",                 limit: 255
    t.bigint   "primary_dietician_id"
    t.string   "cuisine",                       limit: 256
    t.string   "company",                       limit: 255
    t.string   "designation",                   limit: 255
    t.boolean  "was_active",                                                         default: false
    t.boolean  "is_community",                                                       default: false
    t.bigint   "doctor_info_id"
    t.boolean  "workbook_given",                                                     default: false
    t.bigint   "doctor_id"
    t.boolean  "is_terms_accepted"
    t.datetime "terms_accepted_on"
    t.string   "signup_source",                 limit: 255
    t.boolean  "is_call_me",                                                         default: true,  null: false
    t.decimal  "creatinine"
    t.datetime "od_start_date"
    t.datetime "od_changed_date"
    t.date     "enroll_for_trial_course"
    t.boolean  "allow_post"
    t.string   "lead_source"
    t.datetime "last_kumulos_sync"
    t.datetime "pledge_submitted_on"
    t.date     "grace_period_requested_on"
    t.boolean  "nutri_literate_achieved"
    t.text     "transformation_journey_url"
    t.integer  "coins_earned"
    t.integer  "coins_redeemed"
    t.string   "doctor_change_by",              limit: 255
    t.date     "doctor_change_date"
    t.string   "relative_email",                limit: 255
    t.boolean  "referral_amount_credited",                                           default: false
    t.text     "utm_medium"
    t.text     "preferred_app_language"
    t.string   "goals",                         limit: 255
    t.boolean  "nutriclub_interest"
    t.string   "subtitle_language",             limit: 100
    t.date     "content_expiry_date"
    t.integer  "renewal_assignment_priority"
    t.boolean  "is_from_umc"
    t.text     "ios_metadata"
    t.text     "identity_token_ios"
    t.boolean  "channel_partner"
    t.index ["app_user_id"], name: "ix_client_appuser_3", using: :btree
    t.index ["lead_id"], name: "clientss_lead_id_index", using: :btree
  end

  create_table "client_activities", force: :cascade do |t|
    t.text     "activity"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
  end

  create_table "client_activities_done_info", force: :cascade do |t|
    t.datetime "createdon",                                null: false
    t.datetime "last_update",                              null: false
    t.integer  "client_activities_id"
    t.bigint   "appointment_id"
    t.bigint   "client_id"
    t.datetime "activity_done_on"
    t.bigint   "activity_done_by"
    t.text     "activity_comment"
    t.string   "was_client_happy_with_values", limit: 50
    t.string   "activity_status",              limit: 256
    t.datetime "completed_on"
    t.datetime "future_activity_date"
  end

  create_table "client_activity_emails", force: :cascade do |t|
    t.integer  "client_activity_id"
    t.integer  "client_email_id"
    t.integer  "client_id"
    t.datetime "time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "bill_activity"
  end

  create_table "client_additional_data", id: :bigint, force: :cascade do |t|
    t.text     "chance_of_upgrade"
    t.bigint   "chance_of_upgrade_entered_by"
    t.datetime "createdon",                                             default: -> { "now()" }, null: false
    t.datetime "last_update",                                           default: -> { "now()" }, null: false
    t.text     "all_diet_plan"
    t.integer  "point15"
    t.integer  "last_seven_days_fd"
    t.date     "last_diet_plan_given_on"
    t.date     "last_comment_given_on"
    t.date     "expiry_date"
    t.decimal  "hd_balance",                   precision: 10, scale: 2
    t.integer  "nps"
    t.integer  "program_rating"
    t.integer  "form_for_nlwcount"
    t.decimal  "weight_loss_in30days",         precision: 10, scale: 2
    t.integer  "badges_count"
    t.date     "last_stock_given_on"
    t.date     "last_appt_served_on"
    t.date     "next_appointment_date"
    t.integer  "fav_healty_food_count"
    t.decimal  "profile_percentage",           precision: 10, scale: 2
    t.decimal  "diet_log_per",                 precision: 10, scale: 2
    t.integer  "overall_score"
    t.decimal  "diet_log_per_thirty_day",      precision: 10, scale: 2
    t.boolean  "smart_pref_filled"
  end

  create_table "client_badge", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id"
    t.string   "client_badge",            limit: 25
    t.string   "badge_type",              limit: 12
    t.date     "created_date"
    t.integer  "cycle"
    t.boolean  "is_visible"
    t.datetime "visibility_updated_date"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "no_of_logs"
    t.datetime "createdon",                          null: false
    t.datetime "last_update",                        null: false
  end

  create_table "client_bp_info", force: :cascade do |t|
    t.bigint   "client_id",            null: false
    t.datetime "createdon",            null: false
    t.datetime "last_update",          null: false
    t.integer  "systolic",             null: false
    t.integer  "disatolic",            null: false
    t.datetime "for_date",             null: false
    t.bigint   "added_by_app_user_id", null: false
  end

  create_table "client_centre", primary_key: ["client_id", "centre_id"], force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "centre_id", null: false
  end

  create_table "client_challenge_points", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "challenge_points_id"
    t.integer  "points_earned"
    t.datetime "createdon"
    t.datetime "last_update"
    t.datetime "for_date"
  end

  create_table "client_challenge_tracker", force: :cascade do |t|
    t.datetime "createdon",                        null: false
    t.datetime "last_update",                      null: false
    t.bigint   "challenge_id"
    t.bigint   "client_id"
    t.integer  "video_watch_status"
    t.string   "activity_status",       limit: 20
    t.datetime "activity_completed_on"
    t.datetime "video_completed_at"
    t.date     "challenge_assigned_on"
    t.boolean  "video_coin_earned"
    t.boolean  "activity_coin_earned"
    t.string   "activity_data"
    t.bigint   "discussion_id"
  end

  create_table "client_charity_count", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id"
    t.float    "balance"
    t.datetime "mile_stone_date"
    t.bigint   "milestone_count"
    t.datetime "createdon",       null: false
    t.datetime "last_update",     null: false
    t.index ["client_id", "milestone_count"], name: "uq_client_charity_count", unique: true, using: :btree
  end

  create_table "client_coins_history", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "coin_type_id"
    t.integer  "amount"
    t.integer  "available_coins"
    t.string   "transaction_type", limit: 50
    t.datetime "createdon",                    null: false
    t.datetime "last_update",                  null: false
    t.string   "comment",          limit: 255
    t.string   "coupon_code",      limit: 100
    t.text     "metadata"
  end

  create_table "client_communication", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id",                                      null: false
    t.string   "communication_type", limit: 5
    t.text     "description"
    t.datetime "comm_time"
    t.datetime "createdon",                                      null: false
    t.datetime "last_update",                                    null: false
    t.text     "sg_event_id"
    t.boolean  "is_opened",                      default: false
    t.boolean  "is_clicked"
    t.string   "property",           limit: 255
  end

  create_table "client_daily_activities", force: :cascade do |t|
    t.bigint   "client_id"
    t.date     "event_date", null: false
    t.json     "event_json", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_diet_analysis", id: :integer, force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "client_name"
    t.decimal  "hd_consumption",                    precision: 10, scale: 2
    t.decimal  "protein",                           precision: 10, scale: 2
    t.decimal  "carb",                              precision: 10, scale: 2
    t.decimal  "sugar",                             precision: 10, scale: 2
    t.decimal  "fiber",                             precision: 10, scale: 2
    t.decimal  "fat",                               precision: 10, scale: 2
    t.decimal  "exercise_duration",                 precision: 10, scale: 2
    t.text     "exercise_type"
    t.decimal  "no_of_free_foods",                  precision: 10, scale: 2
    t.decimal  "no_of_unhealthy_foods",             precision: 10, scale: 2
    t.decimal  "salads",                            precision: 10, scale: 2
    t.decimal  "sprouts",                           precision: 10, scale: 2
    t.decimal  "fruits",                            precision: 10, scale: 2
    t.decimal  "non_veg",                           precision: 10, scale: 2
    t.decimal  "veg_juice",                         precision: 10, scale: 2
    t.datetime "createdon",                                                  null: false
    t.datetime "last_update",                                                null: false
    t.decimal  "shake_aday_water",                  precision: 10, scale: 2
    t.decimal  "shake_aday_milk",                   precision: 10, scale: 2
    t.decimal  "butter_milk",                       precision: 10, scale: 2
    t.decimal  "alcohol",                           precision: 10, scale: 2
    t.decimal  "egg",                               precision: 10, scale: 2
    t.decimal  "brown_rice",                        precision: 10, scale: 2
    t.decimal  "super_fiber",                       precision: 10, scale: 2
    t.integer  "centre_id"
    t.string   "centre_name",           limit: 255
    t.integer  "dietician_id"
    t.string   "dietician_name",        limit: 255
    t.decimal  "diet_log_per",                      precision: 10, scale: 2
    t.decimal  "exercise_per",                      precision: 10, scale: 2
    t.integer  "active_days"
    t.integer  "finish_days"
    t.integer  "overall_logs"
    t.decimal  "total_wt_loss",                     precision: 10, scale: 2
    t.decimal  "avg_wt_loss",                       precision: 10, scale: 2
    t.boolean  "medication_deduction"
    t.decimal  "tru_fiber",                         precision: 10, scale: 2
    t.index ["client_id"], name: "client_diet_analysis_index_1", using: :btree
  end

  create_table "client_diet_analysis_thirty_days", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "client_name"
    t.decimal  "hd_consumption",                    precision: 10, scale: 2
    t.decimal  "protein",                           precision: 10, scale: 2
    t.decimal  "carb",                              precision: 10, scale: 2
    t.decimal  "sugar",                             precision: 10, scale: 2
    t.decimal  "fiber",                             precision: 10, scale: 2
    t.decimal  "fat",                               precision: 10, scale: 2
    t.decimal  "exercise_duration",                 precision: 10, scale: 2
    t.text     "exercise_type"
    t.decimal  "no_of_free_foods",                  precision: 10, scale: 2
    t.decimal  "no_of_unhealthy_foods",             precision: 10, scale: 2
    t.decimal  "salads",                            precision: 10, scale: 2
    t.decimal  "sprouts",                           precision: 10, scale: 2
    t.decimal  "fruits",                            precision: 10, scale: 2
    t.decimal  "non_veg",                           precision: 10, scale: 2
    t.decimal  "veg_juice",                         precision: 10, scale: 2
    t.datetime "createdon",                                                  null: false
    t.datetime "last_update",                                                null: false
    t.decimal  "shake_aday_water",                  precision: 10, scale: 2
    t.decimal  "shake_aday_milk",                   precision: 10, scale: 2
    t.decimal  "butter_milk",                       precision: 10, scale: 2
    t.decimal  "alcohol",                           precision: 10, scale: 2
    t.decimal  "egg",                               precision: 10, scale: 2
    t.decimal  "brown_rice",                        precision: 10, scale: 2
    t.decimal  "super_fiber",                       precision: 10, scale: 2
    t.integer  "centre_id"
    t.string   "centre_name",           limit: 255
    t.integer  "dietician_id"
    t.string   "dietician_name",        limit: 255
    t.decimal  "diet_log_per",                      precision: 10, scale: 2
    t.decimal  "exercise_per",                      precision: 10, scale: 2
    t.integer  "active_days"
    t.integer  "finish_days"
    t.integer  "overall_logs"
    t.decimal  "total_wt_loss",                     precision: 10, scale: 2
    t.decimal  "avg_wt_loss",                       precision: 10, scale: 2
    t.boolean  "medication_deduction"
    t.decimal  "tru_fiber",                         precision: 10, scale: 2
  end

  create_table "client_dietician", primary_key: ["client_id", "dietician_id"], force: :cascade do |t|
    t.bigint "client_id",           null: false
    t.bigint "dietician_id",        null: false
    t.date   "alloted_at"
    t.text   "dietician_score_map"
    t.index ["client_id"], name: "client_dietician_client_id_key", unique: true, using: :btree
  end

  create_table "client_dietician_allotment_detail", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id",                 null: false
    t.bigint   "dietician_id",              null: false
    t.date     "alloted_at"
    t.text     "dietician_score_map"
    t.text     "dietitian_allotment_reson"
    t.datetime "createdon",                 null: false
    t.datetime "last_update",               null: false
  end

  create_table "client_doctor_info", force: :cascade do |t|
    t.datetime "createdon",                       null: false
    t.datetime "last_update",                     null: false
    t.string   "doctor_name",         limit: 255, null: false
    t.string   "doctor_phone_no",     limit: 255
    t.string   "doctor_address",      limit: 255
    t.string   "doctor_designation",  limit: 255
    t.string   "doctor_company_name", limit: 255
  end

  create_table "client_education_details", force: :cascade do |t|
    t.string   "topic",        limit: 256
    t.text     "topic_detail"
    t.datetime "createdon",                null: false
    t.datetime "last_update",              null: false
  end

  create_table "client_education_given_info", force: :cascade do |t|
    t.bigint   "client_id",                   null: false
    t.datetime "createdon",                   null: false
    t.datetime "last_update",                 null: false
    t.datetime "educated_date",               null: false
    t.integer  "client_education_details_id", null: false
  end

  create_table "client_emails", force: :cascade do |t|
    t.string   "subject"
    t.integer  "client_activity_id"
    t.bigint   "time",               default: 0
    t.text     "body"
    t.string   "pdf_file_name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "client_exercise_tracker", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "exercise_video_id"
    t.integer  "played_duration"
    t.boolean  "liked"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "client_exercise_tracker_logger", force: :cascade do |t|
    t.integer  "client_id",          null: false
    t.integer  "content_id",         null: false
    t.integer  "total_video_played", null: false
    t.integer  "diff_played",        null: false
    t.date     "log_date",           null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "client_family_history", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "relationship"
    t.text     "name"
    t.text     "disease_ids"
    t.integer  "age"
    t.boolean  "on_medication"
    t.text     "details"
    t.boolean  "want_free_consultation"
    t.string   "phone_no",               limit: 10
    t.boolean  "is_everyone_healthy"
    t.datetime "createdon",                         null: false
    t.datetime "last_update",                       null: false
  end

  create_table "client_family_supplement", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "client_family_history_id"
    t.string   "supplement_name",          limit: 255
    t.bigint   "assigned_by_id"
    t.string   "dosage",                   limit: 255
    t.string   "duration",                 limit: 255
    t.datetime "assign_date"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "when_to_take"
    t.text     "notes_to_client"
    t.text     "tool_tip"
    t.boolean  "is_given"
    t.text     "comment"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "client_feedback", id: :bigint, force: :cascade do |t|
    t.datetime "date"
    t.string   "diet_program_feedback",            limit: 255
    t.string   "dietician_service_feedback",       limit: 255
    t.string   "super_food_feedback",              limit: 255
    t.integer  "diet_plan_feedback"
    t.text     "suggestions"
    t.datetime "createdon",                                                    null: false
    t.datetime "last_update",                                                  null: false
    t.bigint   "client_id"
    t.bigint   "fav_super_food_id"
    t.bigint   "submited_by_id"
    t.string   "feedback_status",                  limit: 255
    t.text     "feedback_status_comment"
    t.datetime "feedback_status_date"
    t.text     "feedback_about"
    t.text     "feedback_detail"
    t.text     "app"
    t.text     "referral"
    t.text     "book"
    t.text     "action_comment"
    t.bigint   "action_comment_changed_by_id"
    t.datetime "action_commentdate"
    t.integer  "nps",                              limit: 2
    t.text     "signed_expectation_letter"
    t.text     "given_book"
    t.text     "downloaded_or_told_about_app"
    t.text     "what_attracted_to_jion"
    t.text     "experience_so_far"
    t.string   "happy_with_truweight",             limit: 255
    t.bigint   "compl_catagory_submited_by_id"
    t.bigint   "complaint_submited_by_id"
    t.bigint   "resolve_submited_by_id"
    t.string   "complaint_catagory",               limit: 40
    t.boolean  "complaint",                                    default: false
    t.integer  "complaint_resolve",                limit: 2
    t.date     "compl_catagory_updated_date"
    t.date     "complaint_updated_date"
    t.date     "resolve_updated_date"
    t.bigint   "handled_updated_by_id"
    t.date     "handled_update_date"
    t.string   "feedback_source",                  limit: 25,                  null: false
    t.string   "money_back_policy",                limit: 255
    t.boolean  "wt_loss_expectation"
    t.boolean  "received_call_from_dietician"
    t.boolean  "received_detox_kit"
    t.datetime "called_five_times_date"
    t.string   "feedback_referred_by",             limit: 255
    t.string   "how_did_you_know_about_us",        limit: 255
    t.bigint   "which_doctor_referred_id"
    t.string   "request_category",                 limit: 60
    t.date     "request_category_updated_date"
    t.bigint   "request_category_submitted_by_id"
    t.boolean  "request",                                      default: false
    t.index ["client_id"], name: "ix_client_feedback_client_1", using: :btree
    t.index ["submited_by_id"], name: "ix_client_feedback_submited_by_id", using: :btree
  end

  create_table "client_feedback_super_food", primary_key: ["client_feedback_id", "super_food_id"], force: :cascade do |t|
    t.bigint "client_feedback_id", null: false
    t.bigint "super_food_id",      null: false
    t.index ["client_feedback_id"], name: "ix_client_feedback_super_food_client_feedback_id", using: :btree
  end

  create_table "client_final_score_history", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id",                                       null: false
    t.date     "for_date"
    t.decimal  "final_score",            precision: 10, scale: 2
    t.datetime "createdon",                                       null: false
    t.datetime "last_update",                                     null: false
    t.integer  "last_thirty_days_score"
    t.index ["client_id"], name: "add_filter_client_final_score_history", using: :btree
  end

  create_table "client_glucose_measurement", force: :cascade do |t|
    t.datetime "createdon",                 null: false
    t.datetime "last_update",               null: false
    t.datetime "date",                      null: false
    t.bigint   "client_id",                 null: false
    t.string   "meal_type",     limit: 255, null: false
    t.float    "glucose_level",             null: false
  end

  create_table "client_habit_info", force: :cascade do |t|
    t.bigint   "client_id",   null: false
    t.bigint   "habit_id",    null: false
    t.datetime "date_from"
    t.datetime "date_to"
    t.bigint   "stopped_by"
    t.datetime "stopped_on"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
    t.text     "frequency"
    t.boolean  "is_stopped"
    t.bigint   "started_by"
    t.datetime "started_on"
    t.bigint   "update_by"
  end

  create_table "client_habit_info_temp", id: false, force: :cascade do |t|
    t.integer  "id"
    t.bigint   "client_id"
    t.bigint   "habit_id"
    t.datetime "date_from"
    t.datetime "date_to"
    t.bigint   "stopped_by"
    t.datetime "stopped_on"
    t.datetime "createdon"
    t.datetime "last_update"
    t.text     "frequency"
    t.boolean  "is_stopped"
    t.bigint   "started_by"
    t.datetime "started_on"
    t.bigint   "update_by"
  end

  create_table "client_habit_logs", force: :cascade do |t|
    t.bigint   "client_habit_id"
    t.bigint   "client_id"
    t.datetime "habit_done_date"
    t.bigint   "created_by",      null: false
    t.datetime "createdon",       null: false
    t.datetime "last_update",     null: false
    t.boolean  "is_removed"
  end

  create_table "client_info", id: :integer, force: :cascade do |t|
    t.bigint   "client_id",                null: false
    t.bigint   "health_score"
    t.datetime "date"
    t.datetime "createdon",                null: false
    t.datetime "last_update",              null: false
    t.string   "type",         limit: 255
  end

  create_table "client_medical_history", id: :bigint, force: :cascade do |t|
    t.string   "body_type",           limit: 16
    t.string   "blood_group",         limit: 7
    t.text     "details_of_diseases"
    t.text     "other_disease"
    t.text     "illness"
    t.text     "injuries"
    t.text     "allergies"
    t.text     "operations"
    t.datetime "createdon",                      null: false
    t.datetime "last_update",                    null: false
    t.text     "other_medicine"
  end

  create_table "client_medical_history_allergies", primary_key: ["client_medical_history_id", "allergies_id"], force: :cascade do |t|
    t.bigint "client_medical_history_id", null: false
    t.bigint "allergies_id",              null: false
  end

  create_table "client_medical_history_condition", primary_key: ["client_medical_history_id", "condition_id"], force: :cascade do |t|
    t.bigint "client_medical_history_id", null: false
    t.bigint "condition_id",              null: false
  end

  create_table "client_medical_history_disease", primary_key: ["client_medical_history_id", "disease_id"], force: :cascade do |t|
    t.bigint "client_medical_history_id", null: false
    t.bigint "disease_id",                null: false
  end

  create_table "client_medical_info", id: :bigint, default: -> { "nextval('client_medical_info_seq'::regclass)" }, force: :cascade do |t|
    t.bigint   "client_id"
    t.datetime "date"
    t.string   "vitamin_d",                      limit: 255
    t.string   "vitamin_b12",                    limit: 255
    t.string   "iron",                           limit: 255
    t.string   "haemoglobin",                    limit: 255
    t.string   "total_cholestrol",               limit: 255
    t.string   "trigly_ceride",                  limit: 255
    t.string   "hdl_info",                       limit: 255
    t.string   "ldl_info",                       limit: 255
    t.string   "t3info",                         limit: 255
    t.string   "t4info",                         limit: 255
    t.string   "tsh_info",                       limit: 255
    t.string   "hba1c_info",                     limit: 255
    t.string   "average_blood_sugar",            limit: 255
    t.string   "blood_pressure",                 limit: 255
    t.datetime "createdon",                                  null: false
    t.datetime "last_update",                                null: false
    t.bigint   "uploaded_by_id"
    t.datetime "uploaded_at"
    t.bigint   "file_entity_id"
    t.string   "post_prandialblood_sugar",       limit: 256
    t.string   "uric_acid",                      limit: 255
    t.string   "creatinine",                     limit: 255
    t.boolean  "doctor_appointment"
    t.string   "gfr",                            limit: 255
    t.string   "urea",                           limit: 255
    t.string   "sodium",                         limit: 255
    t.string   "potassium",                      limit: 255
    t.string   "crp",                            limit: 255
    t.string   "homocysteine",                   limit: 255
    t.string   "tpo",                            limit: 255
    t.string   "ama",                            limit: 255
    t.string   "lipase",                         limit: 255
    t.string   "amylase",                        limit: 255
    t.string   "ra_factor",                      limit: 255
    t.string   "copper",                         limit: 255
    t.string   "zinc",                           limit: 255
    t.string   "apolipoprotein_a",               limit: 255
    t.string   "apolipoprotein_b",               limit: 255
    t.string   "prolactin",                      limit: 255
    t.string   "testosterone",                   limit: 255
    t.string   "fsh",                            limit: 255
    t.string   "lh",                             limit: 255
    t.string   "sgot",                           limit: 255
    t.string   "sgpt",                           limit: 255
    t.string   "serum_albumin",                  limit: 255
    t.string   "serum_globulin",                 limit: 255
    t.string   "fasting_insulin",                limit: 255
    t.string   "post_prandial_insulin",          limit: 255
    t.string   "total_rbc",                      limit: 255
    t.string   "mean_corpuscular_volume",        limit: 255
    t.string   "neutrophils",                    limit: 255
    t.string   "lymphocyte_percentage",          limit: 255
    t.string   "pdw",                            limit: 35
    t.string   "plcr",                           limit: 35
    t.string   "ig",                             limit: 35
    t.string   "bilirubin_indirect",             limit: 35
    t.string   "lp_a",                           limit: 35
    t.string   "wbc",                            limit: 35
    t.string   "basophils_ablte_count",          limit: 35
    t.string   "platelet_count",                 limit: 35
    t.string   "pct",                            limit: 35
    t.string   "ap",                             limit: 35
    t.string   "ldl_hdl_ratio",                  limit: 35
    t.string   "ts",                             limit: 35
    t.string   "mch",                            limit: 35
    t.string   "mchc",                           limit: 35
    t.string   "ua_c",                           limit: 35
    t.string   "ig_percent",                     limit: 35
    t.string   "chloride",                       limit: 35
    t.string   "fructosamine",                   limit: 35
    t.string   "dheas",                          limit: 35
    t.string   "bun_sr_creatinine_ratio",        limit: 35
    t.string   "nrbc",                           limit: 35
    t.string   "eosinophils_ab_count",           limit: 35
    t.string   "tibc",                           limit: 35
    t.string   "trig_hdl_ratio",                 limit: 35
    t.string   "ggt",                            limit: 35
    t.string   "bun",                            limit: 35
    t.string   "urea_sr_creatinine_ratio",       limit: 35
    t.string   "basophils",                      limit: 35
    t.string   "protien_total",                  limit: 35
    t.string   "non_hdl_cholstrl",               limit: 35
    t.string   "calcium",                        limit: 35
    t.string   "monosytes",                      limit: 35
    t.string   "bilirubin_direct",               limit: 35
    t.string   "creatinine_serium",              limit: 35
    t.string   "d3hb",                           limit: 35
    t.string   "cystain_c",                      limit: 35
    t.string   "sgot_sgpt_ratio",                limit: 35
    t.string   "nrbc_perc",                      limit: 35
    t.string   "monocytes_ab_count",             limit: 35
    t.string   "bilirubin_total",                limit: 35
    t.string   "rdw_sd",                         limit: 35
    t.string   "vldl_cholstrl",                  limit: 35
    t.string   "hdl_ldl_ratio",                  limit: 35
    t.string   "apo_ba1",                        limit: 35
    t.string   "rdw_cv",                         limit: 35
    t.string   "pcv",                            limit: 35
    t.string   "urinary_microalbumin",           limit: 35
    t.string   "eosinophils",                    limit: 35
    t.string   "neutrophils_ab_count",           limit: 35
    t.string   "lymphocytes_ab_count",           limit: 35
    t.string   "mpv",                            limit: 35
    t.string   "serum_alb_globulin_ratio",       limit: 35
    t.string   "tc_hdl_ratio",                   limit: 35
    t.string   "lp_aa",                          limit: 35
    t.string   "hs_crp",                         limit: 35
    t.string   "uibc",                           limit: 35
    t.text     "psa"
    t.string   "cortisol",                       limit: 35
    t.text     "report_url"
    t.string   "homa2",                          limit: 35
    t.string   "specific_gravity",               limit: 35
    t.string   "urinary_bilirubin",              limit: 35
    t.string   "urine_blood",                    limit: 35
    t.string   "urobilinogen",                   limit: 35
    t.string   "urinary_glucose",                limit: 35
    t.string   "urine_ketone",                   limit: 35
    t.string   "urinary_leucocytes",             limit: 35
    t.string   "nitrite",                        limit: 35
    t.string   "ph",                             limit: 35
    t.string   "urinary_protien",                limit: 35
    t.string   "vitamin_a",                      limit: 35
    t.string   "vitamin_e",                      limit: 35
    t.string   "vitamin_k",                      limit: 35
    t.string   "vitamin_b1_thiamin",             limit: 35
    t.string   "vitamin_b2_riboflavin",          limit: 35
    t.string   "vitamin_b3_nicotinic_acid",      limit: 35
    t.string   "vitamin_b5_pantothenic",         limit: 35
    t.string   "vitamin_b6_p5p",                 limit: 35
    t.string   "vitamin_b6_pyridoxal5phosphate", limit: 35
    t.string   "vitamin_b7_biotin",              limit: 35
    t.string   "vitamin_b9_folic_acid",          limit: 35
    t.string   "atg",                            limit: 35
    t.string   "accp",                           limit: 35
    t.string   "ana",                            limit: 35
    t.string   "ferritin",                       limit: 35
    t.string   "lp_pla2",                        limit: 35
    t.string   "magnesium",                      limit: 35
    t.string   "silver",                         limit: 35
    t.string   "aluminium",                      limit: 35
    t.string   "arsenic",                        limit: 35
    t.string   "barium",                         limit: 35
    t.string   "beryllium",                      limit: 35
    t.string   "bismuth",                        limit: 35
    t.string   "cadmium",                        limit: 35
    t.string   "cobalt",                         limit: 35
    t.string   "chromium",                       limit: 35
    t.string   "caesium",                        limit: 35
    t.string   "mercury",                        limit: 35
    t.string   "manganese",                      limit: 35
    t.string   "molydenum",                      limit: 35
    t.string   "nickel",                         limit: 35
    t.string   "lead",                           limit: 35
    t.string   "antimony",                       limit: 35
    t.string   "appearance",                     limit: 35
    t.string   "bacteria",                       limit: 35
    t.string   "bile_pigment",                   limit: 35
    t.string   "bile_salt",                      limit: 35
    t.string   "casts",                          limit: 35
    t.string   "colour",                         limit: 35
    t.string   "crystals",                       limit: 35
    t.string   "epithetical_cells",              limit: 35
    t.string   "microalbumin",                   limit: 35
    t.string   "mucus",                          limit: 35
    t.string   "parasite",                       limit: 35
    t.string   "red_blood_cells",                limit: 35
    t.string   "volume",                         limit: 35
    t.string   "yeast",                          limit: 35
    t.string   "fasting_blood_sugar",            limit: 35
    t.string   "cp",                             limit: 35
    t.string   "folate",                         limit: 35
    t.string   "nicotine_metabolites",           limit: 35
    t.string   "selenium",                       limit: 35
    t.string   "strontium",                      limit: 35
    t.string   "thallium",                       limit: 35
    t.string   "tin",                            limit: 35
    t.string   "uranium",                        limit: 35
    t.string   "vandium",                        limit: 35
    t.string   "esr",                            limit: 35
    t.string   "tsh",                            limit: 35
    t.string   "vitamin_d2",                     limit: 35
    t.string   "alpha_1_antitrypsin",            limit: 35
    t.string   "androstenedione",                limit: 35
    t.string   "aldosterone",                    limit: 35
    t.string   "vitamin_d3",                     limit: 35
    t.string   "hydroxyprogesterone",            limit: 35
    t.string   "corticosterone",                 limit: 35
    t.string   "deoxycortisol",                  limit: 35
    t.string   "dehydroepiandrosterone",         limit: 35
    t.string   "estradiol",                      limit: 35
    t.string   "progesterone",                   limit: 35
    t.string   "vitamin_d_total",                limit: 35
    t.boolean  "is_initial"
    t.string   "aldrostenedione",                limit: 10
    t.string   "pylori_iga",                     limit: 20
    t.string   "pylori_igg",                     limit: 20
    t.string   "epstein_barr",                   limit: 20
    t.string   "ft3",                            limit: 20
    t.string   "ft4",                            limit: 20
    t.string   "aat",                            limit: 20
    t.string   "amh",                            limit: 50
    t.string   "anti_mullerian_hormone",         limit: 50
    t.index ["client_id"], name: "client_medical_info_client_id_01", using: :btree
    t.index ["file_entity_id"], name: "ix_client_medical_info_file_entity", using: :btree
  end

  create_table "client_medical_info_extra_parame", primary_key: ["client_medical_info_id", "extra_parameter_id"], force: :cascade do |t|
    t.bigint "client_medical_info_id", null: false
    t.bigint "extra_parameter_id",     null: false
    t.index ["client_medical_info_id"], name: "client_medical_info_extra_parame_client_medical_info_01", using: :btree
  end

  create_table "client_medication", force: :cascade do |t|
    t.datetime "createdon",                             null: false
    t.datetime "last_update",                           null: false
    t.datetime "date",                                  null: false
    t.bigint   "client_id",                             null: false
    t.integer  "disease_id",                limit: 2,   null: false
    t.string   "medication",                limit: 255
    t.string   "dosage",                    limit: 255
    t.string   "power",                     limit: 255
    t.boolean  "is_taking"
    t.bigint   "updated_by"
    t.boolean  "is_changed"
    t.text     "change_comment"
    t.float    "frequency"
    t.boolean  "is_taking_same_medication"
    t.text     "stop_med_feedback"
  end

  create_table "client_medication_logs", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "logged_by"
    t.bigint   "medication_id"
    t.datetime "logged_on",     null: false
    t.datetime "createdon",     null: false
    t.datetime "last_update",   null: false
    t.boolean  "is_taken"
  end

  create_table "client_meeting_for_gift", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "meeting_done_by"
    t.datetime "createdon",                      null: false
    t.datetime "last_update",                    null: false
    t.string   "was_client_happy",   limit: 50
    t.string   "how_many_referrals", limit: 50
    t.text     "comments"
    t.string   "meeting_pic_url",    limit: 255
  end

  create_table "client_mile_stone", force: :cascade do |t|
    t.bigint   "client_id"
    t.integer  "milestone_in_kg"
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "social_media_review_given"
  end

  create_table "client_month_kit_movement", force: :cascade do |t|
    t.bigint   "client_id",                           null: false
    t.bigint   "month_kit_id",                        null: false
    t.bigint   "movement_id"
    t.bigint   "bill_id",                             null: false
    t.date     "send_date"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "given",               default: false
    t.boolean  "will_give_later",     default: false
    t.boolean  "to_be_couriered",     default: false
    t.date     "given_date"
    t.date     "requested_date"
    t.date     "possible_given_date"
    t.string   "month_kit_code"
    t.index ["bill_id"], name: "index_client_month_kit_movement_bill_id", using: :btree
    t.index ["client_id"], name: "index_client_month_kit_movement_client_id", using: :btree
    t.index ["month_kit_id"], name: "index_client_month_kit_movement_on_month_kit_id", using: :btree
    t.index ["movement_id"], name: "index_client_month_kit_movement_movement_id", using: :btree
  end

  create_table "client_monthly_review", id: :bigint, force: :cascade do |t|
    t.datetime "from_date"
    t.datetime "to_date"
    t.integer  "wt_loss"
    t.integer  "inch_loss"
    t.string   "excercise",       limit: 255
    t.string   "diet",            limit: 255
    t.text     "reason"
    t.string   "benefits",        limit: 255
    t.integer  "scale"
    t.integer  "happiness_scale"
    t.text     "plan"
    t.bigint   "client_id"
    t.datetime "createdon",                   null: false
    t.datetime "last_update",                 null: false
    t.bigint   "created_by_id"
    t.bigint   "updated_by_id"
  end

  create_table "client_monthly_review_comment", id: :bigint, force: :cascade do |t|
    t.datetime "createdon",                null: false
    t.datetime "last_update",              null: false
    t.bigint   "comment_id"
    t.bigint   "client_monthly_review_id"
  end

  create_table "client_motivation", id: :bigint, force: :cascade do |t|
    t.text     "motivation_loosing_weight"
    t.text     "fear_not_loosing_weight"
    t.text     "weakness_of_weight_loss"
    t.text     "overcome_hindrance"
    t.text     "high_sacrifice_items"
    t.text     "low_sacrifice_items"
    t.text     "others"
    t.text     "coach_tips"
    t.datetime "createdon",                                   null: false
    t.datetime "last_update",                                 null: false
    t.text     "primary_workout"
    t.text     "primary_workout_detail"
    t.text     "primary_motivation_details"
    t.text     "fear_not_loosing_weight_details"
    t.text     "bigger_the_why"
    t.text     "visualisation"
    t.string   "health_priority",                  limit: 50
    t.boolean  "want_to_change_health_priority"
    t.string   "new_health_priority",              limit: 50
    t.text     "give_more_importance_to_health"
    t.text     "activity_want_to_do"
    t.text     "gives_you_happiness"
    t.text     "problem_you_are_facing"
    t.integer  "notification_count"
    t.datetime "health_prority_submitted_on"
    t.datetime "bigger_the_why_submitted_on"
    t.datetime "sacrifice_form_submitted_on"
    t.datetime "visualisation_submitted_on"
    t.datetime "gives_you_happiness_submitted_on"
    t.datetime "motivation_form_submitted_on"
    t.index ["id"], name: "ix_motivation_client_28", using: :btree
  end

  create_table "client_motivation_hindrances", primary_key: ["hindrances_id", "client_motivation_id"], force: :cascade do |t|
    t.bigint "hindrances_id",        null: false
    t.bigint "client_motivation_id", null: false
    t.text   "hindernces_comments"
  end

  create_table "client_not_loosing_weight", id: :bigint, force: :cascade do |t|
    t.string   "stress_levels", limit: 255
    t.string   "medical_test",  limit: 255
    t.string   "diet_chart",    limit: 255
    t.string   "probiotics",    limit: 255
    t.string   "diet_diary",    limit: 255
    t.string   "sleeping",      limit: 255
    t.string   "exercise",      limit: 255
    t.string   "supplements",   limit: 255
    t.string   "cheating",      limit: 255
    t.string   "strict_diet",   limit: 255
    t.datetime "filled_date"
    t.integer  "score"
    t.datetime "createdon",                 null: false
    t.datetime "last_update",               null: false
    t.bigint   "client_id"
    t.bigint   "created_by_id"
    t.bigint   "updated_by_id"
    t.string   "reason",        limit: 255
  end

  create_table "client_not_loosing_weight_comment", id: :bigint, force: :cascade do |t|
    t.datetime "createdon",                    null: false
    t.datetime "last_update",                  null: false
    t.bigint   "comment_id"
    t.bigint   "client_not_loosing_weight_id"
  end

  create_table "client_notification_control", force: :cascade do |t|
    t.bigint   "client_id"
    t.string   "name",        limit: 255
    t.boolean  "is_approved"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "client_occupation", id: :bigint, force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "descrpition"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "client_permission", force: :cascade do |t|
    t.bigint   "client_id",     null: false
    t.jsonb    "permission",    null: false
    t.bigint   "changed_by_id", null: false
    t.datetime "createdon",     null: false
    t.datetime "last_update",   null: false
  end

  create_table "client_pref_pref_category", primary_key: ["client_preference_id", "preference_category_id"], force: :cascade do |t|
    t.bigint "client_preference_id",   null: false
    t.bigint "preference_category_id", null: false
  end

  create_table "client_preference", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "comfortable_drinking_veg_juice"
    t.bigint   "possible_to_cook_complex_items"
    t.bigint   "occupation"
    t.boolean  "workout"
    t.bigint   "preferenced_food"
    t.boolean  "comfortable_with_gluten"
    t.bigint   "days_comfortable_soups_in_night"
    t.bigint   "variety_or_simple"
    t.string   "regional_preference",             limit: 255
    t.datetime "createdon"
    t.datetime "last_update"
    t.string   "shake_aday",                      limit: 100
    t.string   "oil",                             limit: 10
    t.integer  "grain_free"
    t.text     "rice_type"
    t.bigint   "carry_lunch_to_office"
    t.boolean  "does_cook_at_home",                           default: false
    t.bigint   "ready_mix_dosa_idli"
    t.string   "source",                          limit: 128
    t.bigint   "shake_aday_flavour"
  end

  create_table "client_preference_food", primary_key: ["client_preference_id", "food_id"], force: :cascade do |t|
    t.bigint "client_preference_id", null: false
    t.bigint "food_id",              null: false
  end

  create_table "client_recipe_tracker", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "recipes_id"
    t.integer  "played_duration"
    t.boolean  "liked"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "client_referral_codes", force: :cascade do |t|
    t.integer  "client_id"
    t.text     "referral_code"
    t.integer  "code_usage_count",                default: 0
    t.integer  "code_used_by_client_ids",                     array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "purchased_by_client_ids",                     array: true
    t.text     "code_used_by_phones",                         array: true
    t.text     "code_used_by_emails",                         array: true
    t.integer  "package_purchased_by_client_ids",             array: true
  end

  create_table "client_referral_submitted", force: :cascade do |t|
    t.text     "referred_by_lead_id"
    t.text     "referred_by_phone"
    t.text     "referred_by_email"
    t.text     "referral_phone",                       null: false
    t.text     "referral_email"
    t.text     "referral_name"
    t.text     "referral_city"
    t.text     "referral_lead_id"
    t.boolean  "processed",            default: false
    t.boolean  "referred_anonymously", default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "referred_by_name"
    t.text     "ls_response_text"
    t.index ["referral_email"], name: "unique_key_client_referral_submitted", unique: true, using: :btree
    t.index ["referral_phone"], name: "unique_key_client_referral_submitted_ph", unique: true, using: :btree
  end

  create_table "client_refund_info", force: :cascade do |t|
    t.bigint   "client_id",                                              null: false
    t.datetime "createdon",                                              null: false
    t.datetime "last_update",                                            null: false
    t.datetime "client_ask_refund_date"
    t.datetime "initiation_date",                                        null: false
    t.bigint   "initiated_by_id",                                        null: false
    t.boolean  "initiated_status"
    t.string   "initiated_comment",                         limit: 1024
    t.string   "initiated_broad_reason",                    limit: 255
    t.decimal  "amount_to_be_refund"
    t.bigint   "bill_id"
    t.string   "first_month_kit_status",                    limit: 255
    t.string   "approval_status",                           limit: 64
    t.string   "approval_comment",                          limit: 1024
    t.bigint   "approved_by_id"
    t.datetime "approved_date"
    t.string   "bank_name",                                 limit: 255
    t.string   "account_no",                                limit: 255
    t.string   "ifsc_code",                                 limit: 255
    t.string   "transferred_status",                        limit: 255
    t.datetime "transferred_date"
    t.bigint   "transferred_by_id"
    t.decimal  "transferred_amount"
    t.bigint   "approval_comment_by_id"
    t.datetime "approval_comment_date"
    t.bigint   "kit_changed_by_id"
    t.datetime "kit_changed_date"
    t.bigint   "refund_changed_by_id"
    t.datetime "refund_changed_date"
    t.bigint   "bank_changed_by_id"
    t.datetime "bank_changed_date"
    t.bigint   "account_no_changed_by_id"
    t.datetime "account_no_changed_date"
    t.bigint   "ifsc_code_changed_by_id"
    t.datetime "ifsc_code_changed_date"
    t.bigint   "transferred_status_changed_by_id"
    t.datetime "transferred_status_changed_date"
    t.string   "account_name",                              limit: 255
    t.bigint   "account_name_changed_by_id"
    t.datetime "account_name_changed_date"
    t.string   "reference_no",                              limit: 255
    t.bigint   "reference_changed_by_id"
    t.datetime "reference_changed_date"
    t.text     "refund_mode_amount_detail"
    t.date     "actual_expiry_date"
    t.date     "broad_reason_change_date"
    t.bigint   "broad_reason_by_id"
    t.string   "convinced_for_additional_month",            limit: 50
    t.bigint   "convinced_chaged_by"
    t.datetime "convinced_chaged_date"
    t.decimal  "amount_to_bank"
    t.bigint   "amount_to_bank_change_by"
    t.datetime "amount_to_bank_changed_date"
    t.decimal  "refund_to_loan"
    t.bigint   "refund_to_loan_change_by"
    t.datetime "refund_to_loan_changed_date"
    t.datetime "date_of_full_pay"
    t.bigint   "date_of_full_pay_change_by"
    t.datetime "date_of_full_pay_changed_date"
    t.datetime "date_of_payment"
    t.bigint   "date_of_payment_change_by"
    t.datetime "date_of_payment_changed_date"
    t.text     "loan_provider"
    t.bigint   "loan_provider_change_by"
    t.datetime "loan_provider_changed_date"
    t.string   "loan_status",                               limit: 255
    t.bigint   "loan_status_change_by"
    t.datetime "loan_status_changed_date"
    t.decimal  "amount_refunded_to_loan"
    t.bigint   "amount_refunded_to_loan_change_by"
    t.datetime "amount_refunded_to_loan_changed_date"
    t.datetime "date_of_refund_given_to_loan"
    t.bigint   "date_of_refund_given_to_loan_change_by"
    t.datetime "date_of_refund_given_to_loan_changed_date"
    t.text     "account_team_comment"
    t.bigint   "account_team_comment_change_by"
    t.datetime "account_team_comment_changed_date"
    t.string   "was_sevice_fault",                          limit: 50
    t.bigint   "was_sevice_fault_change_by"
    t.datetime "was_sevice_fault_changed_date"
    t.text     "refund_tags",                                                         array: true
    t.bigint   "refund_tags_change_by"
    t.datetime "refund_tags_changed_date"
    t.text     "quality_team_comment"
    t.bigint   "quality_team_comment_change_by"
    t.datetime "quality_team_comment_changed_date"
    t.text     "loan_holder_name"
    t.text     "loan_holder_name_change_by"
    t.datetime "loan_holder_name_changed_date"
    t.text     "status"
    t.bigint   "interest_amount"
    t.text     "interest_amount_change_by"
    t.datetime "interest_amount_changed_date"
    t.text     "upload_check_url"
  end

  create_table "client_reminder_tracker", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "reminder_id"
    t.string   "time",        limit: 20
    t.text     "frequency"
    t.string   "unit",        limit: 50
    t.string   "status",      limit: 20
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "client_score", id: :bigint, force: :cascade do |t|
    t.float    "points"
    t.bigint   "client_id"
    t.datetime "awarded_at"
    t.string   "category_for_points", limit: 255
    t.datetime "createdon",                       null: false
    t.datetime "last_update",                     null: false
    t.index ["client_id"], name: "ix_client_score_client_01", using: :btree
  end

  create_table "client_suggestion", id: :bigint, force: :cascade do |t|
    t.integer  "month"
    t.bigint   "client_id",                      null: false
    t.datetime "from_date"
    t.datetime "to_date"
    t.text     "nutrient_data"
    t.text     "sent_messages"
    t.text     "report_data"
    t.text     "score_info"
    t.datetime "createdon",                      null: false
    t.datetime "last_update",                    null: false
    t.string   "nutrient_data_enum", limit: 255
  end

  create_table "client_supplement_details", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "suggestion_json"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "client_supplement_logs", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "logged_by"
    t.bigint   "supplement_id"
    t.datetime "logged_on"
    t.boolean  "is_taken"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "client_survey_history", force: :cascade do |t|
    t.bigint   "client_id",                      null: false
    t.integer  "survey_monkey_details_id",       null: false
    t.integer  "client_activities_done_info_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["client_id", "client_activities_done_info_id", "survey_monkey_details_id"], name: "unique_key_client_survey_history", unique: true, using: :btree
  end

  create_table "client_symptoms", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "symptom_index"
    t.text     "symptoms"
    t.text     "symptom_data"
    t.text     "symptom_diagnosis"
    t.text     "symptom_trigger"
    t.text     "symptom_worsens"
    t.text     "symptom_relief"
    t.text     "medication_allergies"
    t.text     "willing_to_take_suppliments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "no_symptoms"
  end

  create_table "client_symptoms_update", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "updated_symptoms"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "client_transferred_history", id: :bigint, force: :cascade do |t|
    t.bigint   "new_dietician_id"
    t.bigint   "old_dietician_id"
    t.bigint   "client_id"
    t.integer  "transfer_count"
    t.datetime "createdon",        null: false
    t.datetime "last_update",      null: false
  end

  create_table "client_upgrade_details", force: :cascade do |t|
    t.string   "interest_level"
    t.integer  "interest_level_by_user"
    t.datetime "interest_level_time"
    t.string   "mode_of_payment"
    t.integer  "mode_of_payment_by_user"
    t.datetime "mode_of_payment_time"
    t.integer  "not_picking_up_count",    default: 0
    t.integer  "not_picking_up_by_user"
    t.datetime "not_picking_up_time"
    t.string   "comments",                default: [],              array: true
    t.integer  "client_id"
    t.integer  "bill_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.datetime "callback_time"
    t.integer  "callback_user"
  end

  create_table "client_vip_info", force: :cascade do |t|
    t.bigint   "client_id",                          null: false
    t.datetime "createdon",                          null: false
    t.datetime "last_update",                        null: false
    t.boolean  "is_vip",             default: false
    t.text     "vip_reason"
    t.bigint   "vip_change_by_id"
    t.datetime "vip_change_by_date",                 null: false
  end

  create_table "client_vita_connect_token", force: :cascade do |t|
    t.bigint   "client_id",                                 null: false
    t.string   "source",        limit: 128,                 null: false
    t.text     "connect_token",                             null: false
    t.boolean  "status",                    default: false
    t.datetime "createdon",                                 null: false
    t.datetime "last_update",                               null: false
  end

  create_table "client_weight_history", id: :bigint, force: :cascade do |t|
    t.float    "max_weight"
    t.string   "when_gain_weight",             limit: 255
    t.decimal  "long_term_weight_loss_goal",                precision: 6,  scale: 2
    t.decimal  "short_term_weight_loss_goal",               precision: 6,  scale: 2
    t.integer  "no_of_months"
    t.integer  "seriousness_level"
    t.integer  "diet_comfortability_level"
    t.bigint   "female_info_id"
    t.datetime "createdon",                                                          null: false
    t.datetime "last_update",                                                        null: false
    t.string   "why_gain_weight",              limit: 1024
    t.boolean  "do_you_excercise_regularly"
    t.text     "excercise_answer"
    t.text     "methods_to_wl"
    t.text     "other"
    t.text     "commitment_level"
    t.text     "have_weighing_machine"
    t.text     "comments_to_achieve_goal"
    t.decimal  "months_to_short_term_wt_loss",              precision: 10, scale: 2
    t.integer  "how_strong_to_loose_weight"
    t.text     "objective_of_joining"
    t.string   "methods_to_wl_others"
  end

  create_table "client_weight_property", force: :cascade do |t|
    t.string "property", limit: 255, null: false
  end

  create_table "client_yet_to_start_info", force: :cascade do |t|
    t.bigint   "client_id",                                  null: false
    t.datetime "createdon",                                  null: false
    t.datetime "last_update",                                null: false
    t.datetime "yet_to_start_date",                          null: false
    t.string   "client_status",                  limit: 64
    t.string   "attempted_status",               limit: 64
    t.datetime "attempted_status_changed_date"
    t.bigint   "attempted_status_changed_by_id"
    t.string   "comment",                        limit: 512
    t.datetime "comment_changed_date"
    t.bigint   "comment_changed_by_id"
  end

  create_table "clients_coupon", force: :cascade do |t|
    t.bigint   "client_id"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
    t.string   "name",        limit: 255
    t.boolean  "is_used"
    t.datetime "expiry_date"
  end

  create_table "closest_hc_pincodes", force: :cascade do |t|
    t.text    "agent1"
    t.text    "agent2"
    t.text    "agent3"
    t.text    "agent4"
    t.text    "agent5"
    t.integer "nearest_pincode"
    t.string  "city"
  end

  create_table "coach_feedback", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "feedback"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "coach_report", force: :cascade do |t|
    t.text     "resultmap"
    t.text     "summary"
    t.bigint   "centreid"
    t.text     "ratinggivencount"
    t.text     "rankmap"
    t.text     "renewalreferalmap"
    t.text     "successfailuremap"
    t.text     "penaltymap"
    t.text     "incentivemap"
    t.text     "leavemap"
    t.text     "absentmap"
    t.text     "dieticianclientactivedaysmap"
    t.text     "monthyear"
    t.datetime "createdon",                    null: false
    t.datetime "last_update",                  null: false
    t.bigint   "team_id"
  end

  create_table "cod_confirmations", force: :cascade do |t|
    t.text     "phone"
    t.integer  "order_id"
    t.integer  "bill_id"
    t.text     "name"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "status",            default: "To be Confirmed"
    t.integer  "attempts",          default: 0
    t.json     "comments"
    t.text     "lead_id"
    t.text     "confirmed_by"
    t.text     "status_updated_by"
  end

  create_table "cod_otp", force: :cascade do |t|
    t.text     "phone"
    t.text     "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coins_type", force: :cascade do |t|
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
    t.string   "coin_type",   limit: 255
    t.integer  "amount"
  end

  create_table "collection", force: :cascade, comment: "Collections are an optional way to organize Cards and handle permissions for them." do |t|
    t.text    "name",                                          null: false, comment: "The user-facing name of this Collection."
    t.text    "description",                                                comment: "Optional description for this Collection."
    t.string  "color",             limit: 7,                   null: false, comment: "Seven-character hex color for this Collection, including the preceding hash sign."
    t.boolean "archived",                      default: false, null: false, comment: "Whether this Collection has been archived and should be hidden from users."
    t.string  "location",          limit: 254, default: "/",   null: false, comment: "Directory-structure path of ancestor Collections. e.g. \"/1/2/\" means our Parent is Collection 2, and their parent is Collection 1."
    t.integer "personal_owner_id",                                          comment: "If set, this Collection is a personal Collection, for exclusive use of the User with this ID."
    t.string  "slug",              limit: 254,                 null: false, comment: "Sluggified version of the Collection name. Used only for display purposes in URL; not unique or indexed."
    t.index ["location"], name: "idx_collection_location", using: :btree
    t.index ["personal_owner_id"], name: "idx_collection_personal_owner_id", using: :btree
    t.index ["personal_owner_id"], name: "unique_collection_personal_owner_id", unique: true, using: :btree
  end

  create_table "collection_revision", force: :cascade, comment: "Used to keep track of changes made to collections." do |t|
    t.text     "before",     null: false, comment: "Serialized JSON of the collections graph before the changes."
    t.text     "after",      null: false, comment: "Serialized JSON of the collections graph after the changes."
    t.integer  "user_id",    null: false, comment: "The ID of the admin who made this set of changes."
    t.datetime "created_at", null: false, comment: "The timestamp of when these changes were made."
    t.text     "remark",                  comment: "Optional remarks explaining why these changes were made."
  end

  create_table "comment", id: :bigint, force: :cascade do |t|
    t.bigint   "commited_by_id"
    t.text     "message"
    t.text     "url"
    t.datetime "count_date"
    t.datetime "createdon",                        null: false
    t.datetime "last_update",                      null: false
    t.bigint   "commented_to_id"
    t.boolean  "reply_expected",   default: false
    t.boolean  "closed_issue",     default: false
    t.bigint   "bill_id"
    t.text     "comment_category"
    t.index ["commented_to_id"], name: "ix_comment_commentedto_8", using: :btree
    t.index ["commited_by_id"], name: "ix_comment_commitedby_8", using: :btree
  end

  create_table "comment_back_up", id: false, force: :cascade do |t|
    t.bigint   "id"
    t.bigint   "commited_by_id"
    t.text     "message"
    t.text     "url"
    t.datetime "count_date"
    t.datetime "createdon"
    t.datetime "last_update"
    t.bigint   "commented_to_id"
    t.boolean  "reply_expected"
    t.boolean  "closed_issue"
  end

  create_table "comment_comment_tag", primary_key: ["comment_id", "comment_tag_id"], force: :cascade do |t|
    t.bigint "comment_id",     null: false
    t.bigint "comment_tag_id", null: false
  end

  create_table "comment_tag", id: :bigint, force: :cascade do |t|
    t.string   "tag_name",    limit: 255
    t.string   "description", limit: 255
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "community", primary_key: "client_id", id: :bigint, force: :cascade do |t|
    t.serial   "id",                                                          null: false
    t.boolean  "request_join_community",             default: false
    t.boolean  "request_confirm",                    default: false
    t.string   "suggested_group",        limit: 255
    t.string   "assigned_group",         limit: 255
    t.datetime "createdon",                          default: -> { "now()" }, null: false
    t.datetime "last_update",                        default: -> { "now()" }, null: false
    t.index ["id"], name: "community_ukey", unique: true, using: :btree
  end

  create_table "community_community_group", primary_key: ["community_id", "community_group_id"], force: :cascade do |t|
    t.bigint "community_id",       null: false
    t.bigint "community_group_id", null: false
  end

  create_table "community_group", primary_key: "applozic_group_id", id: :bigint, force: :cascade do |t|
    t.serial "id",                            null: false
    t.string "group_name",        limit: 255, null: false
    t.string "group_description", limit: 255, null: false
    t.string "group_property",    limit: 255, null: false
    t.index ["id"], name: "community_group_ukey", unique: true, using: :btree
  end

  create_table "community_group_property", force: :cascade do |t|
    t.string "property", limit: 255, null: false
  end

  create_table "complaint", id: :bigint, force: :cascade do |t|
    t.bigint   "complaint_by_id"
    t.bigint   "complaint_to_id"
    t.text     "message"
    t.datetime "complaint_date"
    t.datetime "createdon",       null: false
    t.datetime "last_update",     null: false
  end

  create_table "computation_job", force: :cascade, comment: "Stores submitted async computation jobs." do |t|
    t.integer  "creator_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "type",       limit: 254, null: false
    t.string   "status",     limit: 254, null: false
    t.text     "context"
    t.datetime "ended_at"
  end

  create_table "computation_job_result", force: :cascade, comment: "Stores results of async computation jobs." do |t|
    t.integer  "job_id",                 null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "permanence", limit: 254, null: false
    t.text     "payload",                null: false
  end

  create_table "condition", id: :bigint, force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "consultation_doctor_comments", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "phone"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "disease",                        array: true
    t.text     "comments"
    t.string   "add_tests",         limit: 1000
    t.string   "medications",       limit: 1000
    t.text     "internal_comments"
  end

  create_table "consultation_funnel", force: :cascade do |t|
    t.date    "for_date"
    t.integer "clicks_on_bc"
    t.integer "pincode_entered"
    t.integer "slot_booked"
  end

  create_table "consultation_lead_schedules", force: :cascade do |t|
    t.integer  "consultation_lead_id"
    t.datetime "old_consultation_time"
    t.datetime "new_consultation_time"
    t.datetime "booked_on"
    t.text     "booked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultation_leads", force: :cascade do |t|
    t.text     "lead_id"
    t.datetime "booked_on"
    t.text     "status"
    t.text     "phone"
    t.integer  "age"
    t.text     "email"
    t.integer  "diet_score"
    t.text     "diet_phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.jsonb    "diet_score_questions",       array: true
    t.jsonb    "consultation_questions",     array: true
    t.text     "city"
    t.text     "gender"
    t.text     "name"
    t.text     "height"
    t.integer  "weight"
    t.decimal  "bmi"
    t.text     "appointment_time"
    t.date     "appointment_date"
    t.text     "followup_time"
    t.date     "followup_date"
    t.text     "diseases"
    t.text     "alternate_phone"
    t.text     "completed_by"
    t.datetime "completed_on"
    t.text     "comments"
    t.text     "followup_comments"
    t.text     "call_type"
    t.text     "source"
    t.text     "comments_for_client"
    t.text     "interest_level"
    t.integer  "duration"
    t.text     "package_suggested"
    t.text     "client_asked_sales_call"
    t.text     "done_activity_id"
    t.text     "utm_content"
    t.text     "utm_source"
    t.text     "utm_medium"
    t.text     "utm_campaign"
    t.integer  "total_talktime_at_creation"
    t.integer  "lead_score_at_creation"
    t.integer  "lead_age_at_creation"
    t.text     "preferred_language"
    t.integer  "agent_id"
    t.text     "agent_name"
    t.text     "parent_name"
    t.text     "parent_phone"
    t.text     "parent_relation"
    t.text     "consultation_status"
    t.integer  "ls_task_id"
    t.text     "profession"
    t.text     "referrer_url"
    t.text     "company"
    t.text     "designation"
    t.text     "was_it_joint_call"
    t.integer  "dietician_id"
    t.text     "coupon_code"
    t.text     "automated_call_status"
    t.text     "lead_stage"
    t.jsonb    "coach_history",              array: true
    t.text     "dietician_assigned_by"
  end

  create_table "core_session", id: :string, limit: 254, force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
  end

  create_table "core_user", force: :cascade do |t|
    t.string   "email",            limit: 254,                     null: false
    t.string   "first_name",       limit: 254,                     null: false
    t.string   "last_name",        limit: 254,                     null: false
    t.string   "password",         limit: 254,                     null: false
    t.string   "password_salt",    limit: 254, default: "default", null: false
    t.datetime "date_joined",                                      null: false
    t.datetime "last_login"
    t.boolean  "is_superuser",                                     null: false
    t.boolean  "is_active",                                        null: false
    t.string   "reset_token",      limit: 254
    t.bigint   "reset_triggered"
    t.boolean  "is_qbnewb",                    default: true,      null: false
    t.boolean  "google_auth",                  default: false,     null: false
    t.boolean  "ldap_auth",                    default: false,     null: false
    t.text     "login_attributes",                                              comment: "JSON serialized map with attributes used for row level permissions"
    t.datetime "updated_at",                                                    comment: "When was this User last updated?"
    t.index ["email"], name: "core_user_email_key", unique: true, using: :btree
  end

  create_table "counselor", id: :bigint, force: :cascade do |t|
    t.bigint   "app_user_id"
    t.string   "experience",  limit: 255
    t.text     "company"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
    t.bigint   "centre_id"
  end

  create_table "counselor_daily_stats", force: :cascade do |t|
    t.date     "report_date",                                                                  null: false
    t.integer  "agent_id"
    t.integer  "target_achieved_perc",                               limit: 2
    t.integer  "target_collection"
    t.decimal  "target_productivity"
    t.integer  "target_referral_leads",                              limit: 2
    t.integer  "target_self_eval_count",                             limit: 2
    t.integer  "collection"
    t.integer  "collection_mtd"
    t.decimal  "productivity"
    t.decimal  "productivity_mtd"
    t.integer  "referral_leads",                                     limit: 2
    t.integer  "referral_leads_mtd",                                 limit: 2
    t.integer  "self_eval_count",                                    limit: 2
    t.integer  "avg_self_eval_score",                                limit: 2
    t.integer  "self_eval_mtd_count",                                limit: 2
    t.integer  "avg_self_eval_mtd_score",                            limit: 2
    t.integer  "eval_count",                                         limit: 2
    t.integer  "avg_eval_score",                                     limit: 2
    t.integer  "eval_mtd_count",                                     limit: 2
    t.integer  "avg_eval_mtd_score",                                 limit: 2
    t.text     "low_productivity_reason"
    t.text     "referral_leads_missed_reason"
    t.text     "self_evaluation_missed_reaon"
    t.text     "low_hit_perc_reason"
    t.integer  "conversion",                                         limit: 2
    t.integer  "conversion_mtd",                                     limit: 2
    t.integer  "no_of_days_present_mtd",                             limit: 2
    t.integer  "penalty"
    t.integer  "penalty_mtd"
    t.json     "balance_due_7days"
    t.text     "balance_due_7days_reason"
    t.json     "cash_in_hand_3days"
    t.text     "cash_in_hand_3days_reason"
    t.text     "low_eval_reason"
    t.integer  "non_converts_without_eval",                          limit: 2
    t.text     "non_converts_without_eval_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visit_done",                                         limit: 2
    t.integer  "visit_done_mtd",                                     limit: 2
    t.text     "high_penalty_reason"
    t.boolean  "present_status"
    t.boolean  "form_filled_status",                                           default: false
    t.integer  "target_penalty",                                     limit: 2
    t.json     "cheque_collected_hc"
    t.integer  "non_converts_without_comments",                      limit: 2
    t.integer  "target_eval_count",                                  limit: 2
    t.text     "hc_not_filled_reason"
    t.text     "penalty_missed_reason"
    t.text     "collection_missed_reason"
    t.text     "cheque_collected_reason"
    t.text     "evaluation_missed_reaon"
    t.text     "no_tl_comment_reason"
    t.text     "no_self_eval_for_non_convert_reason"
    t.text     "no_eval_for_non_convert_reason"
    t.text     "sold_with_no_referral_no_evaluation_reason"
    t.text     "sold_without_referral_reason"
    t.json     "task_pending_7days"
    t.json     "expected_payment_7days"
    t.text     "task_pending_7days_reason"
    t.text     "expected_payment_7days_not_updated_reason"
    t.json     "non_converts_clients"
    t.text     "non_converts_clients_reason"
    t.integer  "member_met",                                         limit: 2
    t.integer  "member_met_mtd",                                     limit: 2
    t.decimal  "referral_collection"
    t.decimal  "referral_collection_mtd"
    t.decimal  "avg_bill_value"
    t.decimal  "avg_bill_value_mtd"
    t.integer  "collection_rank"
    t.text     "non_converts_clients_excuse_and_reason"
    t.bigint   "gross_collection"
    t.integer  "avg_presentation_score",                             limit: 2
    t.decimal  "collection_tc"
    t.decimal  "productivity_tc"
    t.integer  "referral_leads_tc"
    t.integer  "conversion_tc"
    t.integer  "self_eval_count_tc"
    t.integer  "avg_self_eval_score_tc"
    t.integer  "eval_count_tc"
    t.integer  "avg_eval_score_tc"
    t.integer  "penalty_tc"
    t.integer  "visit_done_tc"
    t.decimal  "avg_bill_value_tc"
    t.decimal  "platinum_collections"
    t.decimal  "platinum_collections_mtd"
    t.decimal  "platinum_collections_tc"
    t.decimal  "collection_above_ftl_payments"
    t.decimal  "collection_above_ftl_payments_mtd"
    t.decimal  "columncollection_above_ftl_payments_tc"
    t.decimal  "collection_above_without_approval_payments"
    t.decimal  "collection_above_without_approval_payments_mtd"
    t.decimal  "collection_above_without_approval_payments_tc"
    t.decimal  "collection_less_than_without_approval_payments"
    t.decimal  "collection_less_than_without_approval_payments_mtd"
    t.decimal  "collection_less_than_without_approval_payments_tc"
    t.decimal  "collection_below_approval_payments"
    t.decimal  "collection_below_approval_payments_mtd"
    t.decimal  "columncollection_below_approval_payments_tc"
    t.integer  "converted_visits"
    t.integer  "converted_visits_mtd"
    t.integer  "converted_visits_tc"
    t.text     "converted_leadids",                                                                         array: true
    t.text     "converted_leadids_mtd",                                                                     array: true
    t.integer  "member_met_tc"
    t.decimal  "refund_amt"
    t.decimal  "refund_amt_tc"
    t.decimal  "refund_amt_mtd"
    t.integer  "visit_missed"
    t.integer  "visit_missed_mtd"
    t.integer  "visit_missed_tc"
    t.integer  "avg_rating_score"
    t.integer  "avg_rating_score_mtd"
    t.integer  "avg_rating_score_tc"
    t.integer  "avg_presentation_score_mtd"
    t.integer  "avg_presentation_score_tc"
    t.decimal  "referral_collection_tc"
    t.text     "converted_leadids_tc",                                                                      array: true
    t.decimal  "avg_agent_score"
    t.decimal  "avg_agent_score_month"
    t.decimal  "avg_agent_score_tc"
    t.integer  "hb_done"
    t.integer  "hb_done_tc"
    t.integer  "hb_done_mtd"
    t.integer  "tutorial_recordings"
    t.integer  "tutorial_recordings_mtd"
    t.integer  "tutorial_watched"
    t.integer  "tutorial_watched_mtd"
    t.decimal  "gross_collection_mtd"
    t.integer  "manager_approval_status"
    t.integer  "current_period_rank"
    t.decimal  "last_6_month_avg_coll"
    t.decimal  "affiliate_business"
    t.decimal  "last_6month_arpv"
    t.decimal  "silver_collections"
    t.decimal  "silver_collections_mtd"
    t.decimal  "silver_collections_tc"
    t.integer  "spoken_phone_task"
    t.integer  "spoken_phone_task_tc"
    t.integer  "spoken_phone_task_mtd"
    t.index ["agent_id"], name: "idx_agent_id", using: :btree
    t.index ["report_date"], name: "idx_report_date", using: :btree
  end

  create_table "counselor_dreams", force: :cascade do |t|
    t.string   "email",            limit: 50, null: false
    t.string   "agent_name"
    t.string   "city"
    t.text     "goal_amount"
    t.text     "reason_for_goal"
    t.text     "goal_importance"
    t.text     "alternative_goal"
    t.text     "goal_target"
    t.text     "self_punishment"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at"
  end

  create_table "counselor_incentive", force: :cascade do |t|
    t.bigint   "employee_id",     null: false
    t.string   "month_year"
    t.jsonb    "collection_data"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.jsonb    "incentive_data"
    t.text     "target_cycle"
  end

  create_table "counselor_reason_manager_approvals", force: :cascade do |t|
    t.integer "counselor_daily_stat_id"
    t.text    "comment"
    t.json    "questions"
    t.integer "manager_id"
  end

  create_table "counselor_targets", force: :cascade do |t|
    t.integer  "employee_id",                              null: false
    t.string   "month_year"
    t.bigint   "target_t1"
    t.date     "entry_date",      default: -> { "now()" }
    t.bigint   "target_set_by"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.bigint   "referral_target"
    t.bigint   "target_t2"
    t.bigint   "target"
    t.index ["employee_id"], name: "index_counselor_targets_on_employee_id", using: :btree
  end

  create_table "coupon_criteria", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.json     "criteria",               null: false, array: true
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "version"
  end

  create_table "coupon_redemptions", force: :cascade do |t|
    t.integer  "coupon_id",  null: false
    t.string   "user_id"
    t.string   "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code",                                                     null: false
    t.string   "description"
    t.date     "valid_from",                                               null: false
    t.date     "valid_until"
    t.integer  "redemption_limit"
    t.integer  "coupon_redemptions_count",             default: 0,         null: false
    t.integer  "amount",                               default: 0,         null: false
    t.string   "type",                                                     null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.text     "attachments",                          default: "{}"
    t.string   "code_source",              limit: 255, default: "BILLING"
    t.bigint   "bill_id"
    t.bigint   "client_id"
    t.bigint   "coupon_criteria_id"
    t.integer  "coupon_criteria_indx"
    t.bigint   "gsdc_id"
    t.integer  "consultation_lead"
  end

  create_table "course_client_calls", force: :cascade do |t|
    t.integer  "course_client_id"
    t.integer  "telephony_connector_id"
    t.integer  "called_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
  end

  create_table "course_clients", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "bill_id"
    t.text     "phone"
    t.integer  "crm_app_user_id"
    t.integer  "dietician_app_user_id"
    t.text     "course_name"
    t.date     "billing_date"
    t.date     "activation_date"
    t.text     "crm_feedback"
    t.text     "dietician_feedback"
    t.text     "crm_call_status",                            default: "PENDING"
    t.text     "dietician_call_status",                      default: "PENDING"
    t.integer  "crm_call_duration"
    t.integer  "dietician_call_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "client_name"
    t.bigint   "payment_id"
    t.boolean  "rnr_sms_status",                             default: false
    t.boolean  "rating_sms_status",                          default: false
    t.string   "course_coach",                   limit: 255
    t.string   "course_crm",                     limit: 255
    t.boolean  "coach_rnr_sms_status",                       default: false
    t.boolean  "coach_rating_sms_status",                    default: false
    t.integer  "age"
    t.text     "diseases"
    t.text     "bf_cc_card"
    t.text     "bmi"
    t.text     "programs_in_past"
    t.integer  "height_in_cm"
    t.integer  "weight"
    t.integer  "crm_call_attemps",                           default: 0
    t.integer  "crm_call_sameday_attemps",                   default: 0
    t.date     "crm_feedback_form_filled"
    t.date     "dietician_feedback_form_filled"
    t.text     "trigger"
    t.text     "call_back"
    t.datetime "call_back_time"
    t.boolean  "followup_triggered"
    t.date     "assigned_date"
    t.string   "crm_call_update",                limit: 255
    t.string   "crm_call_attempt",               limit: 255
    t.index ["client_id"], name: "unique_client", unique: true, using: :btree
  end

  create_table "crm_feedbacks", force: :cascade do |t|
    t.text     "phone"
    t.integer  "agent_id"
    t.text     "lead_id"
    t.integer  "client_id"
    t.integer  "rating"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_incentive", force: :cascade do |t|
    t.bigint   "app_user_id",             null: false
    t.string   "email",       limit: 255
    t.float    "amount"
    t.string   "reason",      limit: 255
    t.datetime "for_date",                null: false
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "cron_job_status", id: :bigint, force: :cascade do |t|
    t.integer  "master_cron_job_id"
    t.datetime "for_date"
    t.string   "status",             limit: 50
  end

  create_table "ctc_logged_in_histories", force: :cascade do |t|
    t.integer  "agent_id"
    t.datetime "action_time"
    t.text     "action_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisine_fav_food", force: :cascade do |t|
    t.text     "indian_cuisines"
    t.text     "complete_meal_option"
    t.bigint   "meal_time_id"
    t.bigint   "food_id"
    t.float    "qty"
    t.string   "selected_unit",        limit: 255
    t.datetime "createdon",                        null: false
    t.datetime "last_update",                      null: false
  end

  create_table "daf_forms", force: :cascade do |t|
    t.text     "client_phone"
    t.text     "agent_email"
    t.text     "thinking_for_losing_weight"
    t.text     "tried_losing_weight"
    t.text     "thinking_for_losing_weight_reason"
    t.text     "how_serious_range_select"
    t.text     "bounce_back"
    t.text     "all_disease_data"
    t.text     "bmi"
    t.text     "age"
    t.text     "height"
    t.text     "weight"
    t.text     "gender"
    t.text     "link_between_weight_immunity"
    t.text     "low_protein"
    t.text     "having_less_super_foods"
    t.text     "eating_less_food"
    t.text     "too_much_carb"
    t.text     "how_many_kgs"
    t.text     "in_how_many_months"
    t.text     "how_serious_ur_goals"
    t.text     "making_modification_to_ur_diet"
    t.text     "top_three_things_for_loosing_weight"
    t.text     "support_from_family"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ls_task_id"
    t.text     "note"
    t.text     "owner"
    t.text     "status"
    t.text     "why_not_making_bill"
    t.text     "passtosc"
    t.text     "interest_level"
    t.text     "not_interested_reason"
    t.date     "followup_date"
    t.text     "followup_time"
    t.text     "followup_type"
    t.text     "income_level"
    t.text     "expected_amount"
    t.date     "expected_date"
    t.text     "chance_of_payment"
    t.text     "package_pitched"
    t.text     "reasons"
    t.float    "final_amount_offered"
    t.text     "secondary_package_pitched"
    t.float    "secondary_package_amount_offered"
    t.text     "why_not_used_digital_presentation"
    t.text     "what_to_do_better"
    t.text     "make_client_more_interested"
    t.text     "super_food"
    t.text     "write_why_late_meeting"
    t.text     "show_handbook"
    t.text     "display_superfoods"
    t.text     "screenshot_of_success"
    t.text     "emails_of_success"
    t.text     "download_mobile_app"
    t.text     "finally_offer"
    t.text     "offered_below_offer_price"
    t.text     "did_client_speak_to_manager"
    t.text     "main_real_objections"
    t.text     "hb_package"
    t.text     "high_commitment"
    t.text     "pricing_only_major_concern_checkbox"
    t.text     "has_credit_bf_card"
    t.text     "client_get_emi"
    t.text     "payment_mode_pitched"
    t.text     "client_said_for_video_consultation"
    t.text     "form_filled_in"
    t.text     "hc_agenda"
    t.text     "purchase_today"
    t.text     "how_long_suffering"
    t.text     "hba1c_level"
    t.text     "blood_sugar_level"
    t.text     "check_blood_sugar"
    t.text     "oral_medication"
    t.text     "take_insulin"
    t.text     "all_diabetes_program"
    t.text     "thinking_for_reverse_diabetes_reason"
    t.text     "link_between_weight_diabetes"
    t.text     "low_energy_level"
    t.text     "frequent_urination"
    t.text     "have_scar_on_leg"
    t.text     "aware_of_long_term_complication"
    t.text     "afread_of_having_diabetes_in_future"
    t.text     "alergies"
    t.text     "do_physical_activity"
    t.text     "uric_acid_level"
    t.text     "other_medical_conditions"
    t.text     "restriction_due_to_kidney_issue"
    t.text     "form_type",                                default: "weightloss"
    t.text     "thinking_for_not_reverse_diabetes_reason"
    t.text     "diabetes_or_weightloss"
    t.text     "thought_of_diabetes_reversal"
    t.text     "family_member_with_diabetes"
    t.text     "likely_to_get_emi"
    t.text     "pitching_emi_or_not"
    t.text     "lead_id"
    t.text     "on_zero_carb"
    t.text     "having_less_fibre"
    t.text     "how_motivated_range_select"
    t.text     "know_infection_wound_not_heal"
    t.text     "aware_of_longterm_complication"
    t.text     "long_term_complications_of_diabetes"
    t.text     "taking_consultation_for"
    t.text     "problems_due_to_diabetes"
    t.text     "why_reverse_diabetes"
    t.text     "why_not_purchase_today"
    t.text     "losing_weight_will_reverse_diabetes"
    t.text     "lose_weight_motivated_range_select"
    t.text     "why_no_for_video_consultation"
    t.text     "show_company_video"
    t.text     "show_company_brochure"
    t.text     "show_value_for_money_video"
    t.text     "take_doctor_on_call"
    t.text     "show_weight_loss_journey"
    t.text     "zoom_hangout"
    t.text     "client_camera"
    t.text     "duration_of_call"
    t.text     "comment_on_vc"
    t.text     "success_on_vc"
    t.text     "objections_by_clients"
    t.text     "client_wants_super_food"
    t.text     "which_vehicle"
    t.text     "profession"
    t.text     "company"
    t.text     "designation"
    t.text     "quality_score"
    t.text     "mobile_price"
    t.text     "vc_pitched"
    t.integer  "engagement_score"
    t.integer  "lead_score"
    t.text     "device_name"
    t.text     "client_feedback_whi_transform"
    t.text     "client_package_preference"
    t.text     "client_package_preference_reason"
    t.text     "is_client_decision_maker"
    t.text     "ask_to_speak_with_decision_maker"
    t.text     "spoke_with_decision_maker"
    t.text     "low_bmi_client_interest"
    t.text     "how_many_months_program"
    t.text     "appreciate"
    t.text     "how_long_thinking_of_losing_weight"
    t.text     "call_completed_till"
    t.text     "time_for_daf_and_presentation"
    t.text     "symptoms"
    t.text     "eat_or_order_from_outside"
    t.text     "money_spend_on_junk_food"
    t.text     "office_travel"
    t.text     "language"
    t.float    "emi_amount_offered"
    t.integer  "no_of_emi"
    t.text     "eat_healthy_or_not"
    t.text     "source"
  end

  create_table "daily_diet_tip", force: :cascade do |t|
    t.text     "title"
    t.text     "content_url"
    t.text     "banner_url"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
    t.text     "tip_content"
    t.string   "type",        limit: 100
    t.string   "language",    limit: 64
  end

  create_table "daily_sales_report", primary_key: "sales_date", id: :date, force: :cascade do |t|
    t.decimal  "cash_collection"
    t.decimal  "db_card_collection"
    t.decimal  "cr_card_collection"
    t.decimal  "cheque_collection"
    t.decimal  "ol_collection"
    t.decimal  "bf_collection"
    t.decimal  "bill_collection"
    t.integer  "no_hv_for_tom"
    t.integer  "no_walkin_for_tom"
    t.integer  "no_hv_booked_today"
    t.integer  "no_walkin_booked_today"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "home_visit_completed_actual"
    t.integer  "walkin_completed_actual"
    t.integer  "no_hv_converted"
    t.integer  "no_walkin_converted"
    t.integer  "count_new_leads"
    t.decimal  "average_time_to_first_call"
    t.integer  "count_leads_not_attempted"
    t.integer  "count_leads_not_called"
    t.integer  "count_leads_source_others"
    t.integer  "count_leads_city_blank"
    t.integer  "count_home_visit_booked_for_today"
    t.integer  "count_walkin_booked_for_today"
    t.integer  "count_home_visit_converted_today"
    t.integer  "count_walkin_converted_today"
    t.decimal  "total_call_duration_today"
    t.decimal  "total_talktime_today"
    t.integer  "total_connected_call_today"
    t.integer  "count_task_overdue_today"
    t.integer  "count_tcs_present_today"
    t.integer  "count_missed_visit_rescheduled_today"
    t.integer  "count_missed_visit_not_interested_today"
    t.integer  "count_missed_visit_not_responding_today"
    t.integer  "count_feedback_calls_done_today"
    t.decimal  "referral_collection"
    t.decimal  "renewal_collection"
    t.integer  "count_referral_from_form"
    t.integer  "count_referral_not_from_form"
    t.integer  "count_appointment_form_filled"
    t.integer  "count_appoint_and_address_form_filled"
    t.integer  "count_visit_missed_by_us"
    t.decimal  "total_uncleared_chq_amount"
    t.decimal  "total_uncleared_bf_amount"
    t.decimal  "total_balance_amount"
    t.integer  "count_referral_comment_done"
    t.integer  "count_renewal_comment_done"
    t.integer  "count_hv_for_tom_blank"
    t.integer  "count_hv_for_tom_rescheduled"
    t.integer  "count_hv_for_tom_no_pick"
    t.integer  "count_hv_for_tom_followup"
    t.integer  "count_hv_for_tom_other"
    t.integer  "count_referral_comment_pending"
    t.integer  "count_renewal_comment_pending"
    t.integer  "count_connected_calls_ls"
    t.integer  "total_talktime_ls"
    t.integer  "count_person_followup_done_today"
    t.integer  "count_person_followup_booked_for_tom"
    t.integer  "count_person_firsttime_done_today"
    t.integer  "count_referral_visit_booked_for_today"
    t.integer  "count_referral_visit_actual_today"
    t.integer  "count_referral_visit_converted_today"
    t.integer  "count_non_referral_visit_booked_for_today"
    t.integer  "count_non_referral_visit_actual_today"
    t.integer  "count_non_referral_visit_converted_today"
    t.decimal  "total_pdc_chq_amount"
    t.integer  "count_dbl_confirm_yes_tom"
    t.integer  "count_dbl_confirm_no_tom"
    t.integer  "count_dbl_confirm_blank_tom"
    t.integer  "count_dbl_confirm_not_picking_tom"
    t.integer  "count_dbl_confirm_prior_tom"
    t.integer  "total_dialled_call_today"
    t.jsonb    "source_leads"
    t.jsonb    "dialer_leads"
    t.jsonb    "leads_with_phone"
    t.jsonb    "online_leads"
    t.jsonb    "form_leads"
  end

  create_table "dashboard_favorite", force: :cascade, comment: "Presence of a row here indicates a given User has favorited a given Dashboard." do |t|
    t.integer "user_id",      null: false, comment: "ID of the User who favorited the Dashboard."
    t.integer "dashboard_id", null: false, comment: "ID of the Dashboard favorited by the User."
    t.index ["dashboard_id"], name: "idx_dashboard_favorite_dashboard_id", using: :btree
    t.index ["user_id", "dashboard_id"], name: "unique_dashboard_favorite_user_id_dashboard_id", unique: true, using: :btree
    t.index ["user_id"], name: "idx_dashboard_favorite_user_id", using: :btree
  end

  create_table "dashboardcard_series", force: :cascade do |t|
    t.integer "dashboardcard_id", null: false
    t.integer "card_id",          null: false
    t.integer "position",         null: false
    t.index ["card_id"], name: "idx_dashboardcard_series_card_id", using: :btree
    t.index ["dashboardcard_id"], name: "idx_dashboardcard_series_dashboardcard_id", using: :btree
  end

  create_table "data_migrations", id: :string, limit: 254, force: :cascade do |t|
    t.datetime "timestamp", null: false
    t.index ["id"], name: "idx_data_migrations_id", using: :btree
  end

  create_table "databasechangelog", id: false, force: :cascade do |t|
    t.string   "id",            limit: 255, null: false
    t.string   "author",        limit: 255, null: false
    t.string   "filename",      limit: 255, null: false
    t.datetime "dateexecuted",              null: false
    t.integer  "orderexecuted",             null: false
    t.string   "exectype",      limit: 10,  null: false
    t.string   "md5sum",        limit: 35
    t.string   "description",   limit: 255
    t.string   "comments",      limit: 255
    t.string   "tag",           limit: 255
    t.string   "liquibase",     limit: 20
    t.string   "contexts",      limit: 255
    t.string   "labels",        limit: 255
    t.string   "deployment_id", limit: 10
    t.index ["id", "author", "filename"], name: "idx_databasechangelog_id_author_filename", unique: true, using: :btree
  end

  create_table "databasechangeloglock", id: :integer, force: :cascade do |t|
    t.boolean  "locked",                  null: false
    t.datetime "lockgranted"
    t.string   "lockedby",    limit: 255
  end

  create_table "day_schedule", id: :bigint, force: :cascade do |t|
    t.string   "from_time",                limit: 255
    t.string   "to_time",                  limit: 255
    t.string   "day",                      limit: 9
    t.datetime "createdon",                            null: false
    t.datetime "last_update",                          null: false
    t.bigint   "dietician_center_info_id"
    t.bigint   "app_user_id"
    t.bigint   "last_updated_by_id"
    t.index ["app_user_id", "day", "from_time"], name: "day_schedule_app_user_id_day_from_time_key", unique: true, using: :btree
    t.index ["dietician_center_info_id"], name: "ix_day_schedule_dietician_center_info_16", using: :btree
  end

  create_table "dependency", force: :cascade do |t|
    t.string   "model",              limit: 32, null: false
    t.integer  "model_id",                      null: false
    t.string   "dependent_on_model", limit: 32, null: false
    t.integer  "dependent_on_id",               null: false
    t.datetime "created_at",                    null: false
    t.index ["dependent_on_id"], name: "idx_dependency_dependent_on_id", using: :btree
    t.index ["dependent_on_model"], name: "idx_dependency_dependent_on_model", using: :btree
    t.index ["model"], name: "idx_dependency_model", using: :btree
    t.index ["model_id"], name: "idx_dependency_model_id", using: :btree
  end

  create_table "diet_chart", id: :bigint, force: :cascade do |t|
    t.bigint   "diet_plan_id",  null: false
    t.text     "content"
    t.text     "breakfast"
    t.text     "waking_up"
    t.text     "mms"
    t.text     "lunch"
    t.text     "evening_snack"
    t.text     "dinner"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "diet_food_log", id: :bigint, force: :cascade do |t|
    t.bigint   "assign_diet_plans_id"
    t.bigint   "assign_dietcharts_id"
    t.bigint   "food_id",                              null: false
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "is_from_diet_plan",    default: true
    t.datetime "logged_on"
    t.bigint   "meal_time_id"
    t.float    "qty"
    t.boolean  "is_finish_day",        default: false
    t.string   "selected_unit"
    t.boolean  "is_from_search"
    t.bigint   "client_id"
    t.boolean  "is_from_quick_log",    default: false, null: false
    t.text     "status"
    t.index ["client_id"], name: "client_id_idx", using: :btree
    t.index ["logged_on"], name: "ix_logged_on_10", using: :btree
    t.index ["meal_time_id"], name: "ix_diet_food_log_meal_time_28", using: :btree
  end

  create_table "diet_food_log_older", id: false, force: :cascade do |t|
    t.bigint   "id"
    t.bigint   "assign_diet_plans_id"
    t.bigint   "assign_dietcharts_id"
    t.bigint   "food_id"
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "is_from_diet_plan"
    t.datetime "logged_on"
    t.bigint   "meal_time_id"
    t.float    "qty"
    t.boolean  "is_finish_day"
    t.string   "selected_unit"
    t.boolean  "is_from_search"
    t.bigint   "client_id"
    t.boolean  "is_from_quick_log"
  end

  create_table "diet_log", id: :bigint, force: :cascade do |t|
    t.bigint   "entity_id"
    t.bigint   "uploaded_by_id"
    t.datetime "uploaded_date"
    t.datetime "createdon",                      null: false
    t.datetime "last_update",                    null: false
    t.bigint   "chat_id"
    t.boolean  "is_new_comment", default: false
    t.index ["uploaded_by_id"], name: "ix_dietlog_uploaded_by", using: :btree
  end

  create_table "diet_log_report", id: :bigint, force: :cascade do |t|
    t.datetime "date",                                                            null: false
    t.bigint   "dietician_id"
    t.bigint   "client_id"
    t.boolean  "is_finished_day"
    t.integer  "logs_in_aday",                limit: 2
    t.integer  "overall_logs",                limit: 2
    t.decimal  "total_weight_loss",                      precision: 10, scale: 2
    t.integer  "total_no_of_days",            limit: 2
    t.decimal  "avg_weight_loss",                        precision: 10, scale: 2
    t.decimal  "weight_loss_in_fifteen_days",            precision: 10, scale: 2
    t.decimal  "health_dollar_per_day",                  precision: 10, scale: 2
    t.integer  "food_ratings_given",          limit: 2
    t.decimal  "health_balance",                         precision: 10, scale: 2
    t.string   "phone_model",                 limit: 50
    t.string   "app_version",                 limit: 50
    t.datetime "createdon",                                                       null: false
    t.datetime "last_update",                                                     null: false
    t.integer  "nps",                         limit: 2
    t.text     "can_use_app"
    t.text     "client_status"
    t.integer  "center_id",                   limit: 2
    t.text     "center_name"
    t.integer  "total_finish_days"
    t.integer  "total_hd_gt140"
    t.integer  "total_hd_gt100"
    t.integer  "total_hd_lt100"
    t.decimal  "diet_log_per",                           precision: 10, scale: 2
    t.decimal  "exercise_per",                           precision: 10, scale: 2
  end

  create_table "diet_phase", id: :bigint, force: :cascade do |t|
    t.string   "phase_name",  limit: 255
    t.text     "description"
    t.datetime "createdon",                              null: false
    t.datetime "last_update",                            null: false
    t.string   "image_path",  limit: 100
    t.boolean  "is_visible",              default: true
    t.text     "phase_info"
  end

  create_table "diet_plan", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id",        null: false
    t.text     "content"
    t.datetime "prescribed_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint   "prescribed_by_id"
    t.bigint   "diet_comment_id"
    t.bigint   "diet_phase_id"
    t.datetime "createdon",        null: false
    t.datetime "last_update",      null: false
    t.text     "mms"
    t.text     "breakfast"
    t.text     "lunch"
    t.text     "evening_snack"
    t.text     "waking_up"
    t.text     "dinner"
    t.index ["client_id"], name: "ix_diet_plan_client_9", using: :btree
  end

  create_table "diet_recall", id: :bigint, force: :cascade do |t|
    t.boolean  "weekeday"
    t.boolean  "weekend"
    t.string   "em_food_time",   limit: 255
    t.string   "b_food_time",    limit: 255
    t.string   "mms_food_time",  limit: 255
    t.string   "tea_food_time",  limit: 255
    t.string   "d_food_time",    limit: 255
    t.string   "bed_food_time",  limit: 255
    t.string   "wake_up",        limit: 255
    t.string   "sleeping",       limit: 255
    t.string   "water_intake",   limit: 255
    t.string   "freq_eating",    limit: 255
    t.string   "sugar_intake",   limit: 255
    t.string   "milk_kind",      limit: 255
    t.string   "alcohol_intake", limit: 255
    t.string   "smoke",          limit: 255
    t.string   "tea_coffee",     limit: 255
    t.string   "fruits",         limit: 255
    t.string   "milk_prod",      limit: 255
    t.string   "oil",            limit: 255
    t.datetime "createdon",                  null: false
    t.datetime "last_update",                null: false
    t.string   "l_food_time",    limit: 255
  end

  create_table "diet_recall_food_activity", id: :bigint, force: :cascade do |t|
    t.bigint   "diet_recall_id"
    t.bigint   "meal_time_id"
    t.bigint   "food_id"
    t.float    "qty"
    t.string   "selected_unit",  limit: 255
    t.datetime "createdon",                  null: false
    t.datetime "last_update",                null: false
  end

  create_table "diet_score_answer", id: :bigint, force: :cascade do |t|
    t.bigint   "question_id",                          null: false
    t.bigint   "client_id",                            null: false
    t.text     "answer",                               null: false
    t.bigint   "scored_by",                            null: false
    t.datetime "createdon",   default: -> { "now()" }, null: false
    t.datetime "last_update", default: -> { "now()" }, null: false
  end

  create_table "diet_score_question", id: :integer, force: :cascade do |t|
    t.text     "verbiage",                             null: false
    t.boolean  "active"
    t.datetime "createdon",   default: -> { "now()" }, null: false
    t.datetime "last_update", default: -> { "now()" }, null: false
  end

  create_table "dietician", id: :bigint, force: :cascade do |t|
    t.string   "experience",                limit: 255
    t.text     "company"
    t.bigint   "app_user_id"
    t.datetime "createdon",                             null: false
    t.datetime "last_update",                           null: false
    t.integer  "overall_points"
    t.boolean  "is_active"
    t.bigint   "buddy_dietician_id"
    t.bigint   "sr_dietician_id"
    t.datetime "last_client_allocation"
    t.text     "ethnicities"
    t.text     "languages"
    t.datetime "last_date"
    t.integer  "max_daily_allocation"
    t.integer  "max_clients"
    t.text     "location_cities"
    t.bigint   "crm_id"
    t.bigint   "ayurveda_id"
    t.boolean  "is_not_assign_vip_clients"
    t.string   "dietician_criteria",        limit: 256
    t.datetime "is_active_from"
    t.string   "qualification",             limit: 255
    t.index ["app_user_id"], name: "ix_dietician_appuser_13", using: :btree
  end

  create_table "dietician_center_info", id: :bigint, force: :cascade do |t|
    t.bigint   "dietician_id"
    t.bigint   "center_id"
    t.datetime "createdon",    null: false
    t.datetime "last_update",  null: false
    t.index ["center_id"], name: "ix_dietician_center_info_cent_15", using: :btree
    t.index ["dietician_id"], name: "ix_dietician_center_info_diet_14", using: :btree
  end

  create_table "dietician_diseases", primary_key: ["dietician_id", "disease_id"], force: :cascade do |t|
    t.bigint "dietician_id", null: false
    t.bigint "disease_id",   null: false
  end

  create_table "dietician_incentive_monthly_rule", force: :cascade do |t|
    t.text     "month_year",                 null: false
    t.text     "renewal_referral_rule"
    t.text     "partial_walking_rule"
    t.bigint   "net_success_rule"
    t.bigint   "first_incentive_rank_rule"
    t.bigint   "second_incentive_rank_rule"
    t.bigint   "third_incentive_rank_rule"
    t.bigint   "penalty_rule"
    t.bigint   "success_rule"
    t.bigint   "collection_rule"
    t.datetime "createdon",                  null: false
    t.datetime "last_update",                null: false
    t.bigint   "collection50k"
    t.bigint   "collection80k"
    t.bigint   "collection1lakh"
    t.index ["month_year"], name: "dietician_incentive_monthly_rule_month_year_key", unique: true, using: :btree
  end

  create_table "dietician_out_of_center", id: :bigserial, force: :cascade do |t|
    t.string   "month",       limit: 15
    t.integer  "no_of_days"
    t.bigint   "app_user_id"
    t.datetime "createdon",              null: false
    t.datetime "last_update",            null: false
    t.datetime "date_from"
    t.datetime "date_to"
  end

  create_table "dietician_penalty", id: :bigint, force: :cascade do |t|
    t.string   "month_year",                 limit: 255
    t.bigint   "dietician_id"
    t.decimal  "productivity",                           precision: 10, scale: 2
    t.decimal  "profile",                                precision: 10, scale: 2
    t.decimal  "not_losing_weight",                      precision: 10, scale: 2
    t.decimal  "amu",                                    precision: 10, scale: 2
    t.decimal  "comment_due",                            precision: 10, scale: 2
    t.decimal  "total_penalty",                          precision: 10, scale: 2
    t.datetime "createdon",                                                                       null: false
    t.datetime "last_update",                                                                     null: false
    t.decimal  "open_chat",                              precision: 10, scale: 2
    t.decimal  "penalty_for_diet_chart_due",             precision: 10, scale: 2
    t.decimal  "fav_healthy_food",                       precision: 10, scale: 2
    t.decimal  "exp_report_comments",                    precision: 10, scale: 2
    t.decimal  "deduction_penalty",                      precision: 10, scale: 2, default: "0.0"
    t.decimal  "appointment_penalty",                    precision: 10, scale: 2
    t.decimal  "avg_health_score",                       precision: 10, scale: 2
    t.decimal  "super_food_kit_due",                     precision: 10, scale: 2
    t.decimal  "awl_penalty",                            precision: 10, scale: 2
    t.decimal  "form_not_fill",                          precision: 10, scale: 2
    t.float    "ontime_penalty"
    t.decimal  "medication_penalty",                     precision: 10, scale: 2
    t.decimal  "symptoms_penalty",                       precision: 10, scale: 2
    t.decimal  "lab_report_penalty",                     precision: 10, scale: 2
    t.decimal  "mrf_penalty",                            precision: 10, scale: 2
    t.decimal  "nutriclub_penalty",                      precision: 10, scale: 2
    t.index ["month_year"], name: "dietician_penalty_index_1", using: :btree
  end

  create_table "dietician_penalty_detail", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "dietician_id"
    t.string   "penalty_type",  limit: 255
    t.decimal  "penalty_value",             precision: 10, scale: 2
    t.string   "month_year",    limit: 255
    t.datetime "createdon",                                          null: false
    t.datetime "last_update",                                        null: false
    t.bigint   "penalty_id"
    t.bigint   "deleted_by_id"
    t.boolean  "is_deleted"
    t.index ["client_id", "dietician_id", "penalty_type", "last_update"], name: "index_dietician_penalty_detail", using: :btree
  end

  create_table "dietician_report", id: :bigint, force: :cascade do |t|
    t.string   "month_year",                           limit: 8,                                             null: false
    t.integer  "dietician_id",                         limit: 2
    t.string   "dietician_name",                       limit: 50
    t.integer  "centre_id",                            limit: 2
    t.string   "centre_name",                          limit: 50
    t.integer  "tot_no_of_clients"
    t.decimal  "effective_active_clients",                         precision: 10, scale: 2
    t.decimal  "total_weight_loss",                                precision: 10, scale: 2
    t.decimal  "avg_weight_loss",                                  precision: 10, scale: 2
    t.integer  "no_of_active_mobile_users"
    t.decimal  "no_of_points",                                     precision: 10, scale: 2
    t.decimal  "productivity",                                     precision: 10, scale: 2
    t.integer  "no_of_dietcharts_given"
    t.integer  "no_of_comments"
    t.integer  "no_of_measurements"
    t.integer  "no_of_dieticharts_due"
    t.integer  "no_of_comments_due"
    t.integer  "no_of_measurements_due"
    t.integer  "no_of_clients_loosing_lt1"
    t.integer  "no_of_clients_loosing_between1and1p5"
    t.integer  "no_of_clients_loosing_between1p5and2"
    t.integer  "no_of_clients_loosing_between2and2p5"
    t.integer  "no_of_clients_loosing_gt2p5"
    t.integer  "second_measurement_not_done_clients"
    t.integer  "medical_history_filled_clients"
    t.integer  "supplement_assigned_clients"
    t.integer  "no_of_clients_above5kg_wt_loss"
    t.integer  "no_of_clients_above10kg_wt_loss"
    t.datetime "createdon",                                                                                  null: false
    t.datetime "last_update",                                                                                null: false
    t.integer  "calculated_total_nps"
    t.integer  "not_losing_weight",                    limit: 2
    t.integer  "success_per",                                                                default: 0
    t.integer  "net_success",                                                                default: 0
    t.decimal  "referral_amount",                                  precision: 10, scale: 2
    t.decimal  "renewal_amount",                                   precision: 10, scale: 2
    t.integer  "success_count",                                                              default: 0
    t.integer  "failure_count",                                                              default: 0
    t.decimal  "avg_point15",                                      precision: 10, scale: 2
    t.integer  "tot_open_chat"
    t.decimal  "avg_profile_per",                                  precision: 10, scale: 2
    t.integer  "form_not_losing_weight",                                                     default: 0
    t.decimal  "partial_walkin_amount",                            precision: 10, scale: 2,  default: "0.0"
    t.text     "client_details_json"
    t.decimal  "dietician_incentive",                              precision: 10, scale: 2,  default: "0.0"
    t.decimal  "avg_talktime",                                     precision: 25, scale: 10, default: "0.0"
    t.integer  "no_of_referral_leads",                                                       default: 0
    t.integer  "no_of_buddy_appointments",                                                   default: 0
    t.decimal  "referral_closing_amount"
    t.decimal  "maintenance_amount"
    t.text     "reason_for_deduction"
    t.decimal  "average_health_score",                             precision: 10, scale: 2,  default: "0.0"
    t.integer  "day_since_last_comment"
    t.integer  "pending_task"
    t.string   "day_wise_data",                        limit: 512
    t.decimal  "average_hs_thirty_days",                           precision: 10, scale: 2
    t.integer  "avg_evaluation_score"
    t.integer  "approved_refund_cases"
    t.integer  "total_activity_done"
    t.integer  "video_point"
    t.integer  "total_collection"
    t.integer  "total_ecom_collection"
    t.integer  "no_of_referral_comment"
    t.integer  "no_of_renewal_comment"
    t.decimal  "dietician_referral_closure"
    t.decimal  "sales_referral_closure"
    t.integer  "nutriclub_meeting_clients"
    t.integer  "no_of_nutriclub_meeting"
    t.float    "another_effective_active_clients"
    t.integer  "call_basis_effective_clients"
    t.float    "avg_call_duration"
    t.index ["month_year"], name: "dietician_report_index_1", using: :btree
  end

  create_table "dietician_specialization", primary_key: ["dietician_id", "specialization_id"], force: :cascade do |t|
    t.bigint "dietician_id",      null: false
    t.bigint "specialization_id", null: false
  end

  create_table "dieticians_leaderboard", id: :bigint, force: :cascade do |t|
    t.bigint   "dietician_id"
    t.integer  "rank"
    t.float    "total_score"
    t.float    "twl"
    t.float    "twl_difference"
    t.float    "twl_difference_contribution"
    t.float    "awl"
    t.float    "awl_difference"
    t.float    "awl_difference_contribution"
    t.integer  "success_per"
    t.float    "success_per_contribution"
    t.integer  "net_success_score"
    t.float    "net_success_difference"
    t.float    "net_success_difference_contribution"
    t.float    "dietician_rating"
    t.float    "dietician_net_rating"
    t.float    "net_dietician_contribution_rating"
    t.float    "renewal_amount"
    t.float    "renewal_amount_difference"
    t.float    "renewal_amount_difference_contribution"
    t.float    "referral_amount"
    t.float    "referral_amount_difference"
    t.float    "referral_amount_difference_contribution"
    t.string   "month_year",                              limit: 255
    t.datetime "createdon",                                                                                    null: false
    t.datetime "last_update",                                                                                  null: false
    t.decimal  "final_score",                                         precision: 10, scale: 2, default: "0.0"
    t.float    "nutriclub_attendence_contribution"
    t.float    "monthly_form_contribution"
    t.index ["month_year"], name: "dieticians_leaderboard_index_1", using: :btree
  end

  create_table "dimension", force: :cascade, comment: "Stores references to alternate views of existing fields, such as remapping an integer to a description, like an enum" do |t|
    t.integer  "field_id",                            null: false, comment: "ID of the field this dimension row applies to"
    t.string   "name",                    limit: 254, null: false, comment: "Short description used as the display name of this new column"
    t.string   "type",                    limit: 254, null: false, comment: "Either internal for a user defined remapping or external for a foreign key based remapping"
    t.integer  "human_readable_field_id",                          comment: "Only used with external type remappings. Indicates which field on the FK related table to use for display"
    t.datetime "created_at",                          null: false, comment: "The timestamp of when the dimension was created."
    t.datetime "updated_at",                          null: false, comment: "The timestamp of when these dimension was last updated."
    t.index ["field_id", "name"], name: "unique_dimension_field_id_name", unique: true, using: :btree
    t.index ["field_id"], name: "idx_dimension_field_id", using: :btree
  end

  create_table "discussion", force: :cascade do |t|
    t.text     "topic"
    t.text     "description"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "discussion_batch", force: :cascade do |t|
    t.text     "name"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "topic"
    t.text     "description"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "discussion_chat", force: :cascade do |t|
    t.bigint   "discussion_id"
    t.text     "message"
    t.bigint   "send_by_id"
    t.text     "send_by_role"
    t.boolean  "is_deleted"
    t.boolean  "is_pinned"
    t.text     "chat_type"
    t.datetime "createdon"
    t.datetime "last_update"
    t.bigint   "discussion_batch_id"
    t.bigint   "reply_on_chat_id"
  end

  create_table "disease", id: :bigint, force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "disease_priority_order", force: :cascade do |t|
    t.string   "disease_name", limit: 64
    t.integer  "priority",                null: false
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "disease_reversal_rating", force: :cascade do |t|
    t.bigint   "client_id"
    t.integer  "rating"
    t.bigint   "given_by_id"
    t.text     "comment"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "diwali_gift", primary_key: "client_id", id: :bigint, force: :cascade do |t|
    t.string   "friend_name_1",    limit: 255
    t.string   "friend_phone_1",   limit: 255
    t.string   "friend_email_1",   limit: 255
    t.string   "friend_address_1", limit: 255
    t.string   "friend_zipcode_1", limit: 255
    t.string   "friend_city_1",    limit: 255
    t.string   "friend_name_2",    limit: 255
    t.string   "friend_phone_2",   limit: 255
    t.string   "friend_email_2",   limit: 255
    t.string   "friend_address_2", limit: 255
    t.string   "friend_zipcode_2", limit: 255
    t.string   "friend_city_2",    limit: 255
    t.string   "friend_name_3",    limit: 255
    t.string   "friend_phone_3",   limit: 255
    t.string   "friend_email_3",   limit: 255
    t.string   "friend_address_3", limit: 255
    t.string   "friend_zipcode_3", limit: 255
    t.string   "friend_city_3",    limit: 255
    t.datetime "createdon"
    t.bigint   "movement_id"
  end

  create_table "doc_channel_sms_blasts", force: :cascade do |t|
    t.text     "sheet_name",        null: false
    t.text     "lead_phone",        null: false
    t.text     "lead_name"
    t.text     "dc_team"
    t.integer  "doctors_detail_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at"
  end

  create_table "docchannel_targets", force: :cascade do |t|
    t.integer  "agent_id",      null: false
    t.text     "month_year",    null: false
    t.integer  "target_set_by", null: false
    t.integer  "target",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at"
  end

  create_table "doctor", force: :cascade do |t|
    t.bigint   "app_user_id",                    null: false
    t.text     "speciality",                                  array: true
    t.boolean  "is_active"
    t.datetime "createdon",                      null: false
    t.datetime "last_update",                    null: false
    t.string   "degree_type",        limit: 255
    t.string   "redg_no",            limit: 100
    t.string   "medical_specialist", limit: 255
    t.string   "pin_code",           limit: 100
  end

  create_table "doctor_prescription", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "problems"
    t.text     "reports_required"
    t.text     "comment"
    t.datetime "createdon"
    t.datetime "last_update"
    t.bigint   "submitted_by"
  end

  create_table "doctor_transferred_history", force: :cascade do |t|
    t.bigint   "new_doctor_id"
    t.bigint   "old_doctor_id"
    t.bigint   "client_id"
    t.integer  "transfer_count"
    t.datetime "createdon",      null: false
    t.datetime "last_update",    null: false
  end

  create_table "doctors_detail", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "phone",               limit: 255
    t.string   "email",               limit: 255
    t.datetime "createdon"
    t.datetime "last_update"
    t.string   "dc_team_member_name", limit: 255
    t.text     "lead_id"
    t.string   "lead_source"
    t.bigint   "client_id"
    t.text     "coupon"
  end

  create_table "dp_recording", force: :cascade do |t|
    t.bigint   "home_visit_presentation_id"
    t.string   "recording_url",              limit: 255
    t.integer  "recording_duration"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "ecommerce_shipping_address", force: :cascade do |t|
    t.bigint   "bill_id"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.bigint   "postal_code"
    t.text     "state"
    t.text     "country"
    t.text     "reason"
    t.bigint   "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_data", id: :bigint, force: :cascade do |t|
    t.string   "email_type",   limit: 255
    t.string   "sending_to",   limit: 255
    t.string   "subject",      limit: 255
    t.text     "message_text"
    t.datetime "createdon",                null: false
    t.datetime "last_update",              null: false
    t.string   "send_by",      limit: 255
  end

  create_table "email_receiver", force: :cascade do |t|
    t.string   "email_type",    limit: 255
    t.string   "email_id",      limit: 255
    t.string   "receiver_type", limit: 255
    t.boolean  "is_active",                 null: false
    t.datetime "createdon",                 null: false
    t.datetime "last_update",               null: false
  end

  create_table "employee", force: :cascade do |t|
    t.string   "name",                                          null: false
    t.string   "email",                                         null: false
    t.string   "emp_id",                                        null: false
    t.integer  "inventory_node_id",                             null: false
    t.bigint   "app_user_id"
    t.boolean  "is_active",            default: true
    t.datetime "createdon",            default: -> { "now()" }, null: false
    t.datetime "last_update",          default: -> { "now()" }, null: false
    t.date     "date_of_joining"
    t.date     "date_of_leaving"
    t.text     "password_hash"
    t.text     "password_salt"
    t.text     "password_reset_token"
    t.datetime "password_reset_time"
    t.text     "languages",                                                  array: true
    t.text     "role"
    t.index ["email", "emp_id", "is_active"], name: "unique_key_employee", unique: true, using: :btree
  end

  create_table "employee_webapp_tracker", force: :cascade do |t|
    t.bigint   "app_user_id"
    t.text     "action_type"
    t.text     "action_title"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "employee_working_time", force: :cascade do |t|
    t.bigint   "app_user_id"
    t.integer  "time_in_sec"
    t.date     "date"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
  end

  create_table "engagement_score", force: :cascade do |t|
    t.date    "for_date",         null: false
    t.float   "engagement_score", null: false
    t.integer "for_window"
  end

  create_table "event_tracking", id: false, force: :cascade do |t|
    t.serial   "id",           null: false
    t.bigint   "client_id"
    t.text     "event_name"
    t.text     "event_type"
    t.integer  "event_in_day"
    t.datetime "createdon",    null: false
    t.datetime "last_update",  null: false
    t.index ["event_name", "client_id"], name: "event_tracking_event_name_client_id_index", using: :btree
  end

  create_table "exercise_category", force: :cascade do |t|
    t.text     "exercise_type"
    t.text     "category"
    t.text     "thumbnail_url"
    t.text     "topic"
    t.text     "description"
    t.text     "course_duration"
    t.boolean  "is_visible"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "exercise_video", force: :cascade do |t|
    t.text     "sub_category"
    t.text     "video_url"
    t.text     "thumbnail_url"
    t.text     "topic"
    t.integer  "duration"
    t.datetime "createdon"
    t.datetime "last_update"
    t.integer  "level"
    t.bigint   "show_in_category_id"
  end

  create_table "exercise_video_exercise_category", primary_key: ["exercise_video_id", "exercise_category_id"], force: :cascade do |t|
    t.integer "exercise_video_id",    null: false
    t.integer "exercise_category_id", null: false
  end

  create_table "expected_pays", primary_key: "lead_id", id: :string, limit: 255, force: :cascade do |t|
    t.string   "client_name",            limit: 255
    t.date     "expected_date"
    t.string   "expected_amount",        limit: 255
    t.string   "phone",                  limit: 255
    t.text     "tl_comment"
    t.string   "chances_of_payment",     limit: 255
    t.bigint   "chances_of_payment_int"
    t.string   "city",                   limit: 255
    t.string   "agent",                  limit: 255
    t.string   "agent_name",             limit: 255
    t.text     "last_comment"
    t.string   "type_of_enroll",         limit: 255
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint   "balance_amount"
    t.bigint   "probability_amount"
    t.string   "level_of_interest",      limit: 255
  end

  create_table "extra_parameter", id: :bigint, force: :cascade do |t|
    t.text     "param_name"
    t.text     "param_value"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
  end

  create_table "factor_scales", id: :integer, limit: 2, force: :cascade do |t|
    t.integer  "factor_value",      limit: 2
    t.float    "fat_hdf"
    t.float    "carb_hdf"
    t.float    "micronutrient_hdf"
    t.float    "other_hdf"
    t.datetime "createdon",                   null: false
    t.datetime "last_update",                 null: false
  end

  create_table "faq", id: :bigint, force: :cascade do |t|
    t.text     "question",    null: false
    t.text     "answer",      null: false
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
  end

  create_table "fav_healthy_food", force: :cascade do |t|
    t.bigint   "client_preference_id"
    t.text     "complete_meal_option"
    t.bigint   "meal_time_id"
    t.bigint   "food_id"
    t.float    "qty"
    t.string   "selected_unit",        limit: 255
    t.datetime "createdon",                        null: false
    t.datetime "last_update",                      null: false
  end

  create_table "fav_super_food", id: :bigint, force: :cascade do |t|
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
  end

  create_table "fav_super_food_super_food", primary_key: ["fav_super_food_id", "super_food_id"], force: :cascade do |t|
    t.bigint "fav_super_food_id", null: false
    t.bigint "super_food_id",     null: false
  end

  create_table "feature_flipper", force: :cascade do |t|
    t.text     "feature_name"
    t.boolean  "enabled",      default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "feedback_form", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "reference_id"
    t.text     "feedback_type"
    t.datetime "createdon",       null: false
    t.datetime "last_update",     null: false
    t.integer  "rating"
    t.text     "feedback_option"
    t.text     "comment"
  end

  create_table "female_info", id: :bigint, force: :cascade do |t|
    t.text     "last_delivery"
    t.text     "menopause"
    t.text     "menstrual_period_details"
    t.boolean  "menstrual_period"
    t.boolean  "premenstrual_syndrome"
    t.boolean  "loosing_period"
    t.datetime "createdon",                null: false
    t.datetime "last_update",              null: false
  end

  create_table "file_entity", id: :bigint, force: :cascade do |t|
    t.string   "file_name",     limit: 255
    t.string   "mime_type",     limit: 255
    t.binary   "upload_file"
    t.datetime "createdon",                 null: false
    t.datetime "last_update",               null: false
    t.text     "file_url"
    t.text     "file_url_temp"
  end

  create_table "food", id: :bigint, force: :cascade do |t|
    t.text     "name"
    t.bigint   "track_no",                                                                                     null: false
    t.float    "qty1"
    t.float    "qty2"
    t.float    "qty3"
    t.float    "qty4"
    t.string   "unit"
    t.bigint   "lactose"
    t.bigint   "gluten"
    t.bigint   "taste_scale"
    t.bigint   "cooking_scale"
    t.decimal  "calorie",                                    precision: 10, scale: 2
    t.decimal  "carb",                                       precision: 10, scale: 2
    t.decimal  "fibre",                                      precision: 10, scale: 2
    t.decimal  "sugar",                                      precision: 10, scale: 2
    t.decimal  "fat",                                        precision: 10, scale: 2
    t.decimal  "protein",                                    precision: 10, scale: 2
    t.float    "salt"
    t.float    "cholesterol"
    t.string   "caste",                         limit: 255
    t.string   "phase",                         limit: 255
    t.bigint   "discard_count",                                                       default: 0
    t.bigint   "dislike_count",                                                       default: 0
    t.bigint   "ok_count",                                                            default: 0
    t.bigint   "like_count",                                                          default: 0
    t.bigint   "love_count",                                                          default: 0
    t.string   "category",                      limit: 255
    t.datetime "createdon",                                                           default: -> { "now()" }
    t.datetime "last_update",                                                         default: -> { "now()" }
    t.bigint   "foodtype"
    t.decimal  "water",                                      precision: 10, scale: 2
    t.decimal  "calcium",                                    precision: 10, scale: 2
    t.decimal  "iron",                                       precision: 10, scale: 2
    t.decimal  "potassium",                                  precision: 10, scale: 2
    t.decimal  "sodium",                                     precision: 10, scale: 2
    t.bigint   "created_by_id"
    t.string   "creation_type",                 limit: 30
    t.decimal  "health_discount",                            precision: 10, scale: 2
    t.text     "search_index"
    t.string   "brand",                         limit: 40
    t.string   "oil",                           limit: 6
    t.decimal  "oil_factor",                                 precision: 10, scale: 2
    t.decimal  "carb_health_discount",                       precision: 10, scale: 2
    t.decimal  "fat_health_discount",                        precision: 10, scale: 2
    t.decimal  "micronutrient_health_discount",              precision: 10, scale: 2
    t.decimal  "others_health_discount",                     precision: 10, scale: 2
    t.decimal  "number_of_servings",                         precision: 10, scale: 2
    t.decimal  "health_dollars",                             precision: 10, scale: 2
    t.text     "about"
    t.float    "popularity",                                                          default: 0.0,            null: false
    t.text     "article_url"
    t.text     "alternative_names"
    t.integer  "visible",                       limit: 2,                             default: 1,              null: false
    t.decimal  "exception_effect",                           precision: 10, scale: 2
    t.decimal  "main_qty",                                   precision: 10, scale: 2
    t.string   "main_unit",                     limit: 100
    t.boolean  "free_food"
    t.string   "shopify_thumbnail_url",         limit: 1024
    t.bigint   "shopify_amount"
    t.string   "shopify_page_url",              limit: 1024
    t.integer  "item_id"
    t.text     "cuisine"
    t.bigint   "food_description_id"
    t.text     "good_for_disease"
    t.text     "not_good_for_disease"
    t.text     "good_for_symptoms"
    t.text     "not_good_for_symptoms"
    t.string   "food_product_search",           limit: 255
  end

  create_table "food_description", force: :cascade do |t|
    t.text     "description"
    t.string   "video_thumbnail_url",   limit: 255
    t.string   "video_url",             limit: 255
    t.string   "product_thumbnail_url", limit: 255
    t.string   "product_url",           limit: 255
    t.datetime "createdon",                         null: false
    t.datetime "last_update",                       null: false
    t.string   "product_name",          limit: 255
    t.text     "description_hi"
  end

  create_table "food_disease", primary_key: ["food_id", "disease_id"], force: :cascade do |t|
    t.bigint "food_id",    null: false
    t.bigint "disease_id", null: false
  end

  create_table "food_drink_info", id: :bigint, force: :cascade do |t|
    t.text     "eating_choice"
    t.text     "allergy"
    t.text     "preference"
    t.text     "dislikes"
    t.datetime "createdon",           null: false
    t.datetime "last_update",         null: false
    t.text     "cooking_preferences"
  end

  create_table "food_links", force: :cascade do |t|
    t.bigint "food_id",              null: false
    t.string "category", limit: 50,  null: false
    t.string "title",    limit: 255, null: false
    t.string "url",      limit: 255, null: false
    t.string "image",    limit: 255
    t.index ["food_id", "category"], name: "food_links_index", using: :btree
  end

  create_table "food_name_audit", id: :bigint, force: :cascade do |t|
    t.bigint   "food_id"
    t.string   "previous_food_name", limit: 255
    t.string   "changed_food_name",  limit: 255
    t.bigint   "changed_by_id"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "food_qty_unit", id: :bigint, force: :cascade do |t|
    t.bigint   "food_id",                                          null: false
    t.string   "main_unit",   limit: 255
    t.bigint   "qty_index"
    t.decimal  "qty",                     precision: 10, scale: 2
    t.string   "other_unit",  limit: 255
    t.datetime "createdon",                                        null: false
    t.datetime "last_update",                                      null: false
  end

  create_table "food_rating", id: :bigint, force: :cascade do |t|
    t.datetime "createdon",                  null: false
    t.datetime "last_update",                null: false
    t.bigint   "client_id",                  null: false
    t.string   "rating",         limit: 255
    t.bigint   "food_id",                    null: false
    t.bigint   "created_by_id"
    t.text     "dislike_reason"
    t.index ["client_id"], name: "ix_food_rating_client_id_28", using: :btree
    t.index ["created_by_id"], name: "ix_food_rating_app_user_28", using: :btree
    t.index ["food_id"], name: "ix_food_rating_food_id_28", using: :btree
  end

  create_table "food_substitutes", id: :bigint, force: :cascade do |t|
    t.bigint   "food_id",            null: false
    t.bigint   "substitute_food_id", null: false
    t.datetime "createdon",          null: false
    t.datetime "last_update",        null: false
  end

  create_table "formula_values", id: :bigint, force: :cascade do |t|
    t.decimal "carbs",             precision: 10, scale: 2
    t.decimal "sugar",             precision: 10, scale: 2
    t.decimal "fat",               precision: 10, scale: 2
    t.decimal "protein",           precision: 10, scale: 2
    t.decimal "fibre",             precision: 10, scale: 2
    t.decimal "micronutrient_hdf", precision: 10, scale: 2, default: "1.0"
    t.decimal "other_hdf",         precision: 10, scale: 2, default: "1.0"
    t.decimal "exception_effect",  precision: 10, scale: 2, default: "1.0"
  end

  create_table "frozen", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "frozen_by_id"
    t.bigint   "package_id"
    t.text     "reason"
    t.datetime "frozen_from"
    t.datetime "frozen_to",          null: false
    t.datetime "frozen_at",          null: false
    t.datetime "createdon",          null: false
    t.datetime "last_update",        null: false
    t.integer  "days"
    t.integer  "bill_id"
    t.integer  "frozen_by_agent_id"
    t.index ["bill_id"], name: "ix_frozen_bill_id", using: :btree
    t.index ["client_id"], name: "ix_frozen_client_id", using: :btree
    t.index ["package_id"], name: "ix_frozen_package_id", using: :btree
  end

  create_table "generated_shopify_discount_codes", force: :cascade do |t|
    t.bigint   "price_rule_id"
    t.bigint   "discount_code_id"
    t.string   "code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "guest_login", force: :cascade do |t|
    t.datetime "createdon",                     null: false
    t.datetime "last_update",                   null: false
    t.string   "device_type",       limit: 50
    t.string   "app_version",       limit: 100
    t.string   "os_version",        limit: 100
    t.string   "device_model_name", limit: 255
    t.string   "device_id",         limit: 255
    t.datetime "last_accessed"
    t.text     "reg_id"
    t.text     "advertiser_id"
    t.decimal  "height"
    t.decimal  "weight"
    t.decimal  "bmi"
    t.text     "diseases"
    t.string   "gender",            limit: 10
    t.text     "referrer_id"
    t.bigint   "client_id"
    t.date     "dob"
  end

  create_table "habits", force: :cascade do |t|
    t.string   "habit_name",   limit: 255
    t.text     "description"
    t.bigint   "created_by",               null: false
    t.datetime "createdon",                null: false
    t.datetime "last_update",              null: false
    t.boolean  "habit_status"
  end

  create_table "handle_client_complaint", id: false, force: :cascade do |t|
    t.bigint   "id",                     null: false
    t.bigint   "client_feedback_id"
    t.bigint   "complaint_handle_by_id"
    t.datetime "createdon",              null: false
    t.datetime "last_update",            null: false
  end

  create_table "hc_promo_coupons", force: :cascade do |t|
    t.text     "partner_name"
    t.text     "location"
    t.text     "city"
    t.text     "employee_id"
    t.text     "coupon_code"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "partner_email"
    t.text     "partner_phone"
    t.text     "address"
    t.text     "given_for"
    t.boolean  "agreement_signed", default: false
    t.text     "agreement_path"
    t.integer  "generated_leads",  default: 0
    t.boolean  "dc_coupon"
  end

  create_table "hc_refer_incentives", force: :cascade do |t|
    t.decimal  "percent_on_revenue"
    t.integer  "incentive_on_ref_lead_gen"
    t.integer  "incentive_on_ref_lead_hv"
    t.integer  "incentive_on_ref_lead_met"
    t.integer  "added_by"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "health_blueprint_quiz", force: :cascade do |t|
    t.bigint   "client_id"
    t.datetime "createdon",         null: false
    t.datetime "last_update",       null: false
    t.boolean  "answer"
    t.bigint   "quiz_questions_id"
  end

  create_table "health_box_gift", primary_key: "client_id", id: :bigint, force: :cascade do |t|
    t.string   "book_voucher_name",          limit: 255
    t.string   "book_voucher_product",       limit: 255
    t.string   "book_voucher_phone_no",      limit: 255
    t.string   "book_voucher_email",         limit: 255
    t.string   "book_voucher_address",       limit: 255
    t.string   "book_voucher_message",       limit: 255
    t.string   "superfood_voucher_name",     limit: 255
    t.string   "superfood_voucher_product",  limit: 255
    t.string   "superfood_voucher_phone_no", limit: 255
    t.string   "superfood_voucher_email",    limit: 255
    t.string   "superfood_voucher_address",  limit: 255
    t.string   "superfood_voucher_message",  limit: 255
    t.datetime "created_book_voucher"
    t.datetime "created_superfood_voucher"
    t.bigint   "movement_id"
    t.index ["book_voucher_phone_no"], name: "health_box_gift_book_voucher_phone_no_key", unique: true, using: :btree
    t.index ["superfood_voucher_phone_no"], name: "health_box_gift_superfood_voucher_phone_no_key", unique: true, using: :btree
  end

  create_table "health_dollar", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id",                                                                     null: false
    t.decimal  "credit",        precision: 10, scale: 2, default: "100.0",                      null: false
    t.decimal  "spent",         precision: 10, scale: 2, default: "0.0",                        null: false
    t.decimal  "saved",         precision: 10, scale: 2
    t.decimal  "earned",        precision: 10, scale: 2, default: "0.0",                        null: false
    t.boolean  "is_finish_day",                                                                 null: false
    t.decimal  "balance",       precision: 10, scale: 2
    t.date     "date",                                   default: -> { "('now'::text)::date" }, null: false
    t.datetime "createdon",                              default: -> { "now()" },               null: false
    t.datetime "last_update",                            default: -> { "now()" },               null: false
    t.index ["client_id", "date"], name: "unique_client_date", unique: true, using: :btree
  end

  create_table "hindrances", id: :bigint, force: :cascade do |t|
    t.string   "hindrance_name", limit: 255
    t.datetime "createdon",                  null: false
    t.datetime "last_update",                null: false
  end

  create_table "home_page_content", force: :cascade do |t|
    t.text     "content_type"
    t.text     "image_url"
    t.text     "link_url"
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "is_deleted"
    t.integer  "sequence_no"
  end

  create_table "home_visit_presentation", force: :cascade do |t|
    t.bigint   "presentation_done_by"
    t.string   "lead_id",                             limit: 255
    t.string   "phone_number",                        limit: 20
    t.datetime "createdon",                                       null: false
    t.datetime "last_update",                                     null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "customer_info_page_start_time"
    t.datetime "customer_info_page_end_time"
    t.datetime "company_presentation_start_time"
    t.datetime "company_presentation_end_time"
    t.datetime "pricing_start_time"
    t.datetime "pricing_end_time"
    t.integer  "total_video_played"
    t.bigint   "total_video_played_time_sec"
    t.text     "played_videos_ids"
    t.string   "suggested_packege",                   limit: 100
    t.datetime "date_of_birth"
    t.string   "muscle_percent",                      limit: 50
    t.integer  "body_age"
    t.text     "tried_losing_weight"
    t.string   "bounce_back",                         limit: 255
    t.string   "eating_habits",                       limit: 255
    t.string   "level_of_physical_activity",          limit: 255
    t.string   "support_from_family",                 limit: 50
    t.string   "max_life_time_weight",                limit: 100
    t.text     "max_life_time_weight_when"
    t.string   "gaining_excess_weight",               limit: 100
    t.text     "gaining_excess_weight_reason"
    t.string   "thinking_for_losing_weight",          limit: 100
    t.text     "thinking_for_losing_weight_reason"
    t.integer  "plan_to_lose_how_many_kgs"
    t.integer  "in_how_many_months"
    t.integer  "seriousness_level"
    t.integer  "modification_to_diet"
    t.text     "top_three_things_for_loosing_weight"
    t.string   "visit_status",                        limit: 100
    t.boolean  "recording_permission"
    t.integer  "presentation_score"
    t.text     "why_not_used_digital_presentation"
    t.string   "preferred_language",                  limit: 200
    t.text     "why_score_is_low"
    t.text     "unchecked_call_recording"
    t.text     "presentation_device_type"
    t.text     "why_presentation_on_mobile"
    t.text     "presentation_score_data"
    t.index ["phone_number"], name: "uk_home_visit_presentation", unique: true, using: :btree
  end

  create_table "home_visits", force: :cascade do |t|
    t.text     "lead_id"
    t.integer  "agent_id",   limit: 2
    t.integer  "visit_id"
    t.text     "status"
    t.time     "met_date"
    t.text     "visit_type"
    t.datetime "updated_at"
  end

  create_table "immunity_levels_quiz", force: :cascade do |t|
    t.bigint   "client_id",         null: false
    t.datetime "createdon",         null: false
    t.datetime "last_update",       null: false
    t.boolean  "answer"
    t.bigint   "quiz_questions_id", null: false
  end

  create_table "incentive_types", force: :cascade do |t|
    t.integer "incentive"
    t.text    "reason"
  end

  create_table "ingredient", id: :bigint, force: :cascade do |t|
    t.bigint   "food_id"
    t.bigint   "ingredient_food_id"
    t.float    "quantity"
    t.string   "unit",               limit: 255
    t.datetime "createdon",                      default: -> { "now()" }
    t.datetime "last_update",                    default: -> { "now()" }
  end

  create_table "installs", force: :cascade do |t|
    t.datetime "install_date",                                   null: false
    t.integer  "android_install_count"
    t.integer  "ios_instal_count"
    t.datetime "created_at",            default: -> { "now()" }, null: false
    t.datetime "updated_at",            default: -> { "now()" }, null: false
  end

  create_table "instamojo_webhooks", id: :bigserial, force: :cascade do |t|
    t.text     "data"
    t.string   "url",         limit: 200,                     null: false
    t.string   "status",      limit: 100, default: "PENDING", null: false
    t.datetime "createdon",                                   null: false
    t.datetime "last_update",                                 null: false
  end

  create_table "inventory_movements", force: :cascade do |t|
    t.integer  "item_id",                                                     null: false
    t.integer  "sender_agent_id"
    t.integer  "sender_quantity"
    t.string   "sender_node_type",       limit: 30
    t.integer  "sender_node_id"
    t.date     "sender_date"
    t.integer  "receiver_agent_id"
    t.integer  "receiver_quantity"
    t.string   "receiver_node_type",     limit: 30
    t.integer  "receiver_node_id"
    t.date     "receiver_date"
    t.string   "status",                 limit: 30,                           null: false
    t.text     "comments"
    t.datetime "createdon",                          default: -> { "now()" }, null: false
    t.datetime "last_update",                        default: -> { "now()" }, null: false
    t.string   "courier_name",           limit: 255
    t.string   "tracking_id",            limit: 255
    t.integer  "requestor_id"
    t.integer  "movement_group_id",                                           null: false
    t.integer  "transaction_id"
    t.date     "entry_date"
    t.date     "due_date"
    t.text     "address"
    t.string   "city",                   limit: 255
    t.string   "receiver_node_agent_id", limit: 255
    t.string   "courier_status"
    t.string   "update_log"
    t.datetime "delivery_date"
    t.index ["item_id"], name: "index_inventory_movements_on_item_id", using: :btree
    t.index ["movement_group_id"], name: "index_inventory_movements_on_movement_group_id", using: :btree
    t.index ["receiver_node_id"], name: "index_inventory_movements_on_receiver_node_id", using: :btree
    t.index ["sender_node_id"], name: "index_inventory_movements_on_sender_node_id", using: :btree
  end

  create_table "inventory_node_items", force: :cascade do |t|
    t.bigint  "inventory_node_id",                          null: false
    t.bigint  "item_id",                                    null: false
    t.bigint  "quantity"
    t.decimal "reorder_level",     precision: 10, scale: 2
    t.decimal "critical_level",    precision: 10, scale: 2
    t.decimal "max_stock",         precision: 10, scale: 2
    t.bigint  "current_quantity"
    t.index ["inventory_node_id"], name: "index_inventory_node_items_on_inventory_node_id", using: :btree
    t.index ["item_id"], name: "index_inventory_node_items_on_item_id", using: :btree
  end

  create_table "inventory_nodes", force: :cascade do |t|
    t.string  "name",                limit: 255,                 null: false
    t.boolean "will_do_courier",                 default: false
    t.string  "contact_person_name", limit: 255
    t.string  "contact_number",      limit: 255
    t.string  "tin_no",              limit: 255
    t.text    "address"
    t.boolean "is_active",                       default: false
    t.string  "city"
  end

  create_table "inventory_pantry", force: :cascade do |t|
    t.string  "name",              limit: 255, null: false
    t.integer "inventory_node_id",             null: false
  end

  create_table "inventory_vendors", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "invoice", id: :bigint, force: :cascade do |t|
    t.datetime "invoice_date"
    t.string   "invoice_number",     limit: 255
    t.bigint   "client_id"
    t.bigint   "centre_id"
    t.bigint   "created_by_id"
    t.bigint   "verified_by_id"
    t.string   "mode_of_payment",    limit: 20
    t.string   "card_number",        limit: 255
    t.integer  "card_expiry_month"
    t.integer  "card_expiry_year"
    t.string   "cheque_number",      limit: 255
    t.float    "bill_amount"
    t.float    "amount_paid"
    t.float    "balance_left"
    t.bigint   "product_package_id"
    t.bigint   "sold_by_id"
    t.datetime "createdon",                      null: false
    t.datetime "last_update",                    null: false
    t.text     "metadata"
    t.index ["client_id"], name: "ix_invoice_client_16", using: :btree
    t.index ["product_package_id"], name: "ix_invoice_productpackage_20", using: :btree
  end

  create_table "ipa_tracker", force: :cascade do |t|
    t.string   "ip_address",  limit: 255
    t.string   "refer_code",  limit: 255
    t.boolean  "is_used"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "item_food", force: :cascade do |t|
    t.bigint   "food_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_sales", force: :cascade do |t|
    t.integer  "bill_id",       null: false
    t.integer  "item_id",       null: false
    t.integer  "quantity",      null: false
    t.decimal  "rate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "discount_rate"
    t.index ["bill_id"], name: "index_item_sales_on_bill_id", using: :btree
    t.index ["item_id"], name: "index_item_sales_on_item_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",                                                         null: false
    t.string   "item_type",                                                    null: false
    t.string   "unit",                                                         null: false
    t.decimal  "price"
    t.decimal  "food_price"
    t.decimal  "wellness_price"
    t.decimal  "mrp"
    t.datetime "createdon",                           default: -> { "now()" }, null: false
    t.datetime "last_update",                         default: -> { "now()" }, null: false
    t.boolean  "billing_enabled",                     default: true
    t.boolean  "inventory_enabled",                   default: true
    t.string   "category",                limit: 100
    t.bigint   "shopify_id"
    t.decimal  "cost_price"
    t.bigint   "view_order"
    t.boolean  "is_premium",                          default: false
    t.decimal  "pkt_weight_in_kgs"
    t.boolean  "is_out_of_stock",                     default: false
    t.date     "since_when_out_of_stock"
    t.date     "when_it_will_come"
    t.text     "update_log"
    t.text     "sku_code"
    t.integer  "alternate_item1"
    t.integer  "alternate_item2"
    t.boolean  "dietician_disabled",                  default: false
    t.string   "sub_category",            limit: 255
    t.text     "description"
    t.text     "product_link"
    t.text     "product_image"
    t.float    "cost_point"
    t.integer  "gst_rate"
    t.text     "hsn_code"
    t.text     "food_id_list"
  end

  create_table "job_execution_status", force: :cascade do |t|
    t.text     "job_name"
    t.datetime "createdon",       null: false
    t.datetime "last_update"
    t.datetime "end_time"
    t.text     "server_location"
  end

  create_table "lab_parameter_details", force: :cascade do |t|
    t.text     "param_name"
    t.text     "param_value"
    t.text     "unit"
    t.float    "optimal_low"
    t.float    "optimal_high"
    t.float    "standard_low"
    t.float    "standard_high"
    t.integer  "importance"
    t.text     "categories"
    t.string   "good_if",       limit: 5
    t.text     "about"
    t.text     "if_low"
    t.text     "if_high"
    t.text     "low_sugg"
    t.text     "high_sugg"
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "is_critical"
    t.text     "main_category"
    t.string   "gender",        limit: 10
  end

  create_table "lab_report", force: :cascade do |t|
    t.string   "phone",       limit: 20
    t.string   "name",        limit: 255
    t.date     "test_date"
    t.text     "report_data"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "lab_report_files", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "phone"
    t.text     "file_url"
    t.text     "thumbnail_url"
    t.date     "upload_date"
    t.text     "lead_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lab_test_responses", force: :cascade do |t|
    t.text     "test_provider"
    t.integer  "bill_id"
    t.text     "lead_id"
    t.datetime "appoinment_time"
    t.jsonb    "response_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.jsonb    "request_data"
    t.text     "order_id"
    t.json     "comments"
  end

  create_table "label", force: :cascade do |t|
    t.string "name", limit: 254, null: false
    t.string "slug", limit: 254, null: false
    t.string "icon", limit: 128
    t.index ["slug"], name: "idx_label_slug", using: :btree
    t.index ["slug"], name: "label_slug_key", unique: true, using: :btree
  end

  create_table "lead_metadata", force: :cascade do |t|
    t.text     "phone"
    t.integer  "age"
    t.text     "height"
    t.integer  "weight"
    t.text     "gender"
    t.text     "disease"
    t.text     "what_are_you_looking_for"
    t.text     "profession"
    t.text     "payment_cards"
    t.text     "q1_which_hash_more_calories"
    t.text     "q2_more_important_for_weightloss"
    t.text     "q3_how_much_oats_in_britannia"
    t.text     "email"
    t.text     "languages"
    t.text     "appointment_date"
    t.text     "appointment_time"
    t.datetime "created_at"
    t.datetime "update_at"
    t.text     "bmi"
    t.text     "utm_source"
    t.text     "utm_content"
    t.text     "utm_campaign"
    t.text     "utm_medium"
    t.text     "referrer_url"
    t.text     "lead_id"
    t.text     "why_lose_weight"
    t.text     "name"
    t.text     "source_content"
    t.text     "parent_phone"
    t.text     "parent_relation"
    t.text     "parent_name"
    t.text     "kgs_to_lose"
    t.text     "try_to_lose_earlier"
    t.text     "result_of_attempt"
    t.text     "city"
    t.text     "slot_source_url"
  end

  create_table "loss_of_pays", force: :cascade do |t|
    t.integer  "agent_id"
    t.integer  "given_by_id"
    t.text     "comments"
    t.date     "for_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lop_type"
    t.boolean  "is_deleted"
    t.string   "deleted_reason"
    t.datetime "deleted_on_date"
    t.bigint   "deleted_by_id"
  end

  create_table "lp_discount_offers", force: :cascade do |t|
    t.integer  "discount_per"
    t.datetime "offer_start_time"
    t.datetime "offer_end_time"
    t.text     "discount_code"
    t.boolean  "offer_active",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ls_activities", force: :cascade do |t|
    t.bigint   "activity_type_id", null: false
    t.json     "activity_data",    null: false
    t.bigint   "visit_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "activity_date"
    t.text     "agent_ls_id"
    t.text     "lead_id"
    t.integer  "ls_task_id"
    t.index ["activity_type_id", "lead_id"], name: "lead_type_idx", using: :btree
    t.index ["lead_id", "agent_ls_id", "activity_date"], name: "ls_lead_idx", using: :btree
  end

  create_table "ls_activity_types", force: :cascade do |t|
    t.text    "activity_event_name"
    t.integer "activity_event"
  end

  create_table "ls_task_types", force: :cascade do |t|
    t.text    "task_type"
    t.text    "task_name"
    t.text    "ls_id"
    t.integer "max_call_per_day"
    t.integer "max_calls"
  end

  create_table "ls_tasks", force: :cascade do |t|
    t.text     "task_type"
    t.text     "status"
    t.integer  "agent_id"
    t.datetime "for_date"
    t.text     "lead_id"
    t.text     "phone"
    t.text     "ls_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_new_lead"
    t.boolean  "spoken"
    t.datetime "completed_on"
    t.boolean  "deleted",                   default: false
    t.datetime "start_time"
    t.datetime "deleted_on"
    t.integer  "deleted_by"
    t.text     "booked_by"
    t.integer  "visit_id"
    t.integer  "consultation_lead_id"
    t.text     "city"
    t.integer  "slot_attempts",             default: 0
    t.jsonb    "comments"
    t.text     "agent_email"
    t.text     "languages",                                 array: true
    t.text     "lead_name"
    t.text     "call_status"
    t.text     "next_call_job_id"
    t.integer  "agent_not_picked_up_count", default: 0
    t.jsonb    "auto_call_comments"
    t.integer  "main_consultation_id"
    t.text     "task_name"
    t.boolean  "closed_for_attempts",       default: false
    t.boolean  "closed_for_pending",        default: false
    t.boolean  "task_created_by_agent",     default: false
    t.boolean  "talktime_email_send",       default: false
    t.text     "diseases"
    t.text     "languges",                                  array: true
    t.text     "cuisine"
    t.text     "assignment_comments"
    t.integer  "lead_quality"
    t.date     "expected_date"
    t.integer  "expected_amount"
    t.text     "interest_level"
    t.text     "chance_of_payment"
    t.integer  "engagement_score"
    t.boolean  "sms_sent",                  default: false
    t.integer  "system_attempts",           default: 0
    t.boolean  "call_exact_time",           default: false
    t.datetime "lead_created_at"
    t.index ["lead_id"], name: "lead_id_index", using: :btree
  end

  create_table "lupin_doctor_schedules", force: :cascade do |t|
    t.integer  "lupin_doctor_id"
    t.text     "webinar_link"
    t.datetime "webinar_time"
    t.datetime "created_at"
    t.datetime "update_at"
    t.text     "doctor_type",     default: "General"
    t.text     "language"
    t.text     "zoom_id"
    t.boolean  "recurring",       default: false
    t.text     "mode"
  end

  create_table "lupin_doctors", force: :cascade do |t|
    t.text     "phone"
    t.text     "email"
    t.text     "doctor_name"
    t.datetime "created_at"
    t.datetime "update_at"
    t.text     "doctor_type", default: "General"
    t.text     "language"
  end

  create_table "mail_list", force: :cascade do |t|
    t.string   "email"
    t.string   "team"
    t.boolean  "status"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
  end

  create_table "manager_consultation_forms", force: :cascade do |t|
    t.text     "phone"
    t.integer  "agent_id"
    t.text     "lead_id"
    t.text     "lead_name"
    t.integer  "hc_id"
    t.text     "status"
    t.integer  "duration"
    t.text     "objection"
    t.text     "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "call_date"
    t.text     "recording_link"
    t.text     "manager_call"
  end

  create_table "master_cron_job", id: :integer, force: :cascade do |t|
    t.string "cron_type",    limit: 255
    t.string "schedule_day", limit: 20
  end

  create_table "master_diet_plan", id: :bigint, force: :cascade do |t|
    t.bigint   "diet_phase_id",  null: false
    t.string   "diet_plan_name"
    t.datetime "createdon"
    t.datetime "last_update"
    t.bigint   "updated_by_id"
  end

  create_table "master_diet_plan_alt_data", id: :bigint, force: :cascade do |t|
    t.bigint "master_diet_plan_id"
    t.bigint "meal_time_id"
    t.bigint "food_id"
    t.float  "qty"
    t.bigint "column_index"
    t.bigint "row_index"
    t.string "unit"
  end

  create_table "master_diet_plan_data", id: :bigint, force: :cascade do |t|
    t.bigint "master_diet_plan_id"
    t.bigint "meal_time_id"
    t.bigint "food_id"
    t.float  "qty"
    t.string "unit"
  end

  create_table "meal_time", id: :bigint, force: :cascade do |t|
    t.string "label"
  end

  create_table "medication", id: :bigint, force: :cascade do |t|
    t.bigint   "client_medical_history_id",             null: false
    t.string   "tablet_name",               limit: 255
    t.string   "dosage_time",               limit: 255
    t.string   "dosage",                    limit: 255
    t.text     "reason_for_dose"
    t.datetime "createdon",                             null: false
    t.datetime "last_update",                           null: false
    t.index ["client_medical_history_id"], name: "ix_medication_client_medical__22", using: :btree
  end

  create_table "medicines", force: :cascade do |t|
    t.text     "composition"
    t.text     "common"
    t.text     "names"
    t.text     "for_disease"
    t.integer  "importance"
    t.text     "type"
    t.text     "term"
    t.text     "descreption"
    t.datetime "createdon",     null: false
    t.datetime "last_update",   null: false
    t.bigint   "updated_by_id"
  end

  create_table "metabase_database", force: :cascade do |t|
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "name",                        limit: 254,                            null: false
    t.text     "description"
    t.text     "details"
    t.string   "engine",                      limit: 254,                            null: false
    t.boolean  "is_sample",                               default: false,            null: false
    t.boolean  "is_full_sync",                            default: true,             null: false
    t.text     "points_of_interest"
    t.text     "caveats"
    t.string   "metadata_sync_schedule",      limit: 254, default: "0 50 * * * ? *", null: false, comment: "The cron schedule string for when this database should undergo the metadata sync process (and analysis for new fields)."
    t.string   "cache_field_values_schedule", limit: 254, default: "0 50 0 * * ? *", null: false, comment: "The cron schedule string for when FieldValues for eligible Fields should be updated."
    t.string   "timezone",                    limit: 254,                                         comment: "Timezone identifier for the database, set by the sync process"
    t.boolean  "is_on_demand",                            default: false,            null: false, comment: "Whether we should do On-Demand caching of FieldValues for this DB. This means FieldValues are updated when their Field is used in a Dashboard or Card param."
    t.text     "options",                                                                         comment: "Serialized JSON containing various options like QB behavior."
    t.boolean  "auto_run_queries",                        default: true,             null: false, comment: "Whether to automatically run queries when doing simple filtering and summarizing in the Query Builder."
  end

  create_table "metabase_field", force: :cascade do |t|
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                limit: 254,                    null: false
    t.string   "base_type",           limit: 255,                    null: false
    t.string   "special_type",        limit: 255
    t.boolean  "active",                          default: true,     null: false
    t.text     "description"
    t.boolean  "preview_display",                 default: true,     null: false
    t.integer  "position",                        default: 0,        null: false
    t.integer  "table_id",                                           null: false
    t.integer  "parent_id"
    t.string   "display_name",        limit: 254
    t.string   "visibility_type",     limit: 32,  default: "normal", null: false
    t.integer  "fk_target_field_id"
    t.datetime "last_analyzed"
    t.text     "points_of_interest"
    t.text     "caveats"
    t.text     "fingerprint",                                                     comment: "Serialized JSON containing non-identifying information about this Field, such as min, max, and percent JSON. Used for classification."
    t.integer  "fingerprint_version",             default: 0,        null: false, comment: "The version of the fingerprint for this Field. Used so we can keep track of which Fields need to be analyzed again when new things are added to fingerprints."
    t.text     "database_type",                                      null: false, comment: "The actual type of this column in the database. e.g. VARCHAR or TEXT."
    t.text     "has_field_values",                                                comment: "Whether we have FieldValues (\"list\"), should ad-hoc search (\"search\"), disable entirely (\"none\"), or infer dynamically (null)\""
    t.text     "settings",                                                        comment: "Serialized JSON FE-specific settings like formatting, etc. Scope of what is stored here may increase in future."
    t.index ["parent_id"], name: "idx_field_parent_id", using: :btree
    t.index ["table_id", "name"], name: "idx_uniq_field_table_id_parent_id_name_2col", unique: true, where: "(parent_id IS NULL)", using: :btree
    t.index ["table_id", "parent_id", "name"], name: "idx_uniq_field_table_id_parent_id_name", unique: true, using: :btree
    t.index ["table_id"], name: "idx_field_table_id", using: :btree
  end

  create_table "metabase_fieldvalues", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "values"
    t.text     "human_readable_values"
    t.integer  "field_id",              null: false
    t.index ["field_id"], name: "idx_fieldvalues_field_id", using: :btree
  end

  create_table "metabase_table", force: :cascade do |t|
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "name",                    limit: 254,                 null: false
    t.bigint   "rows"
    t.text     "description"
    t.string   "entity_name",             limit: 254
    t.string   "entity_type",             limit: 254
    t.boolean  "active",                                              null: false
    t.integer  "db_id",                                               null: false
    t.string   "display_name",            limit: 254
    t.string   "visibility_type",         limit: 254
    t.string   "schema",                  limit: 254
    t.text     "points_of_interest"
    t.text     "caveats"
    t.boolean  "show_in_getting_started",             default: false, null: false
    t.text     "fields_hash",                                                      comment: "Computed hash of all of the fields associated to this table"
    t.index ["db_id", "name"], name: "idx_uniq_table_db_id_schema_name_2col", unique: true, where: "(schema IS NULL)", using: :btree
    t.index ["db_id", "schema", "name"], name: "idx_uniq_table_db_id_schema_name", unique: true, using: :btree
    t.index ["db_id", "schema"], name: "idx_metabase_table_db_id_schema", using: :btree
    t.index ["db_id"], name: "idx_table_db_id", using: :btree
    t.index ["show_in_getting_started"], name: "idx_metabase_table_show_in_getting_started", using: :btree
  end

  create_table "metric", force: :cascade do |t|
    t.integer  "table_id",                                            null: false
    t.integer  "creator_id",                                          null: false
    t.string   "name",                    limit: 254,                 null: false
    t.text     "description"
    t.boolean  "archived",                            default: false, null: false
    t.text     "definition",                                          null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.text     "points_of_interest"
    t.text     "caveats"
    t.text     "how_is_this_calculated"
    t.boolean  "show_in_getting_started",             default: false, null: false
    t.index ["creator_id"], name: "idx_metric_creator_id", using: :btree
    t.index ["show_in_getting_started"], name: "idx_metric_show_in_getting_started", using: :btree
    t.index ["table_id"], name: "idx_metric_table_id", using: :btree
  end

  create_table "metric_important_field", force: :cascade do |t|
    t.integer "metric_id", null: false
    t.integer "field_id",  null: false
    t.index ["field_id"], name: "idx_metric_important_field_field_id", using: :btree
    t.index ["metric_id", "field_id"], name: "unique_metric_important_field_metric_id_field_id", unique: true, using: :btree
    t.index ["metric_id"], name: "idx_metric_important_field_metric_id", using: :btree
  end

  create_table "mobile_app_content", force: :cascade do |t|
    t.string   "key",         limit: 255
    t.string   "value",       limit: 500
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "mobile_installation", force: :cascade do |t|
    t.text     "device_id"
    t.text     "device_type"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
    t.integer  "count"
  end

  create_table "mock_form", force: :cascade do |t|
    t.text     "mock_question"
    t.text     "form_name"
    t.text     "team_name"
    t.bigint   "created_by"
    t.bigint   "updated_by"
    t.datetime "createdon"
    t.datetime "last_update"
    t.integer  "score_parameter"
    t.bigint   "order_seq"
  end

  create_table "mock_form_report", force: :cascade do |t|
    t.text     "form_name"
    t.text     "team_name"
    t.bigint   "created_by"
    t.bigint   "updated_by"
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "is_deleted"
  end

  create_table "month_kit", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "kit_type"
    t.bigint   "disease_condition"
    t.text     "eating_choice"
    t.bigint   "sf_box_info_id"
  end

  create_table "month_kit_item", force: :cascade do |t|
    t.bigint   "month_kit_id", null: false
    t.bigint   "item_id",      null: false
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["item_id"], name: "index_month_kit_item_on_item_id", using: :btree
    t.index ["month_kit_id"], name: "index_month_kit_item_on_month_kit_id", using: :btree
  end

  create_table "monthly_review_for_client", force: :cascade do |t|
    t.bigint   "filled_for_app_user_id"
    t.bigint   "filled_by_app_user_id"
    t.integer  "cycle"
    t.datetime "createdon",                      null: false
    t.datetime "last_update",                    null: false
    t.text     "positives_of_the_month"
    t.text     "learnings_of_the_month"
    t.text     "what_could_have_done_better"
    t.text     "plan_for_coming_month"
    t.boolean  "can_improve_hs30"
    t.text     "how_to_improve_hs30"
    t.text     "positives_of_the_month_comment"
  end

  create_table "monthly_stock_reports", force: :cascade do |t|
    t.integer  "inventory_node_id",    null: false
    t.string   "month_year"
    t.integer  "stock_on_first"
    t.integer  "stock_on_last"
    t.bigint   "stock_value_on_first"
    t.bigint   "stock_value_on_last"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "nearest_pincodes", force: :cascade do |t|
    t.integer  "pincode"
    t.float    "lat"
    t.float    "long"
    t.integer  "nearest_codes", array: true
    t.float    "radius"
    t.text     "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "new_ls_report", primary_key: "report_date", id: :date, force: :cascade do |t|
    t.integer  "count_new_leads_hp"
    t.integer  "count_new_leads_hp_attempted"
    t.integer  "count_new_leads_hp_spoken"
    t.integer  "count_new_leads_hp_relevant"
    t.integer  "count_new_leads_hp_relevant_cities"
    t.integer  "count_new_leads_hp_visit_scheduled"
    t.integer  "count_new_leads_hp_visit_confirmed"
    t.integer  "count_new_leads_hp_auto_booking"
    t.integer  "count_new_leads_hp_visits_passed_schedulers_approval"
    t.integer  "count_new_leads_lp"
    t.integer  "count_new_leads_lp_attempted"
    t.integer  "count_new_leads_lp_spoken"
    t.integer  "count_new_leads_lp_relevant"
    t.integer  "count_new_leads_lp_relevant_cities"
    t.integer  "count_new_leads_lp_visit_scheduled"
    t.integer  "count_new_leads_lp_visit_confirmed"
    t.integer  "count_new_leads_lp_auto_booking"
    t.integer  "count_new_leads_lp_visits_passed_schedulers_approval"
    t.integer  "count_total_auto_booking_done"
    t.integer  "count_total_booking_done_schedulers_approval"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "not_available_hc_slots", force: :cascade do |t|
    t.date     "not_available_on_date",                null: false
    t.bigint   "agent_id",                             null: false
    t.bigint   "slot_id",                              null: false
    t.boolean  "not_available",         default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "notification", id: :bigint, force: :cascade do |t|
    t.bigint   "notification_from_id"
    t.bigint   "notification_to_id"
    t.text     "message"
    t.text     "description"
    t.string   "url",                  limit: 255
    t.datetime "notification_date"
    t.datetime "createdon",                                       null: false
    t.datetime "last_update",                                     null: false
    t.bigint   "client_id"
    t.boolean  "is_new_comment"
    t.boolean  "is_seen",                          default: true
    t.index ["notification_to_id"], name: "ix_notification_notification_to_1", using: :btree
  end

  create_table "notification_content", force: :cascade do |t|
    t.text     "category"
    t.integer  "order_seq"
    t.text     "topic"
    t.text     "description"
    t.text     "image_url"
    t.boolean  "is_active"
    t.datetime "createdon"
    t.datetime "last_update"
    t.text     "file_url"
    t.bigint   "file_id"
    t.bigint   "file_category_id"
  end

  create_table "nq_visits", force: :cascade do |t|
    t.boolean  "tl_heard_record"
    t.boolean  "tl_spoken_to_customer"
    t.integer  "visit_id",                        null: false
    t.boolean  "tl_nq_status"
    t.text     "tl_comment"
    t.integer  "updated_by",            limit: 2, null: false
    t.boolean  "admin_nq_status"
    t.text     "admin_comment"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at"
    t.text     "reason_for_nq"
    t.text     "city"
  end

  create_table "nutri_literate_level", force: :cascade do |t|
    t.bigint   "client_id"
    t.integer  "level"
    t.datetime "createdon",       null: false
    t.datetime "last_update",     null: false
    t.integer  "health_score"
    t.integer  "watch_percent"
    t.text     "certificate_url"
  end

  create_table "nutriclub_attendees", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "nutriclub_schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ratings"
    t.text     "comments"
  end

  create_table "nutriclub_meeting_schedules", force: :cascade do |t|
    t.text     "language"
    t.text     "link"
    t.text     "topic"
    t.text     "disease"
    t.text     "schedule_day"
    t.text     "schedule_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "zoom_id"
    t.text     "share_link"
    t.text     "passcode"
    t.boolean  "enabled",       default: true
  end

  create_table "nutriclub_meetings", force: :cascade do |t|
    t.text     "phone"
    t.text     "email"
    t.integer  "client_id"
    t.integer  "dietician_id"
    t.integer  "booked_by"
    t.datetime "meeting_time"
    t.integer  "duration"
    t.boolean  "joined",                        default: false
    t.datetime "joined_time"
    t.datetime "leave_time"
    t.integer  "nutriclub_meeting_schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nutrition_manager_report", force: :cascade do |t|
    t.string   "month_year"
    t.integer  "nutrition_manager_id",            limit: 2
    t.string   "nutrition_manager_name",          limit: 255
    t.bigint   "nutrition_manager_team_id"
    t.integer  "center_id",                       limit: 2
    t.string   "center_name",                     limit: 255
    t.integer  "average_rank"
    t.integer  "average_penalty"
    t.decimal  "average_awl",                                 precision: 10, scale: 2
    t.integer  "renewal_referral_business"
    t.integer  "success_per"
    t.decimal  "average_talktime",                            precision: 10, scale: 2
    t.integer  "average_health_score"
    t.decimal  "average_rating",                              precision: 10, scale: 2
    t.integer  "nlw_form_due"
    t.integer  "diet_chart_due"
    t.integer  "super_food_kit_due"
    t.integer  "appointment_due"
    t.datetime "createdon",                                                            null: false
    t.datetime "last_update",                                                          null: false
    t.integer  "appointment_due_for_new_clients"
    t.integer  "diet_chart_due_for_new_clients"
  end

  create_table "nutrition_manager_team", force: :cascade do |t|
    t.string   "team_name"
    t.datetime "createdon",                      null: false
    t.datetime "last_update",                    null: false
    t.integer  "nutrition_manager_id", limit: 2
  end

  create_table "nutritionist_package_slots", force: :cascade do |t|
    t.integer  "client_id"
    t.date     "slot_date"
    t.text     "slot_time"
    t.text     "payment_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "phone"
    t.text     "call_type",         default: "CALL"
    t.text     "consultation_type", default: "PAID"
  end

  create_table "online_consultation_forms", force: :cascade do |t|
    t.text     "lead_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "visit_happened"
    t.text     "online_spoke"
    t.text     "online_interested"
    t.text     "level_of_interest"
    t.text     "followup_date"
    t.text     "package_pitched"
    t.text     "final_amount_offered"
    t.text     "hb_pitched"
    t.text     "reason_for_not_interested"
    t.text     "no_enrollment_reasons"
    t.text     "willing_to_enroll"
    t.text     "online_status_comments"
    t.text     "height"
    t.text     "weight"
    t.text     "profession"
    t.text     "online_status_updated_by"
    t.text     "online_status_update_date"
    t.integer  "ls_task_id"
    t.text     "status"
    t.text     "chance_of_payment"
    t.text     "expected_amount"
    t.date     "expected_date"
    t.text     "followup_type"
    t.text     "coupon_code"
  end

  create_table "otp_table", id: :bigint, force: :cascade do |t|
    t.bigint   "phone_no"
    t.text     "otp"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
    t.index ["phone_no"], name: "uq_otp_table_phone_no", unique: true, using: :btree
  end

  create_table "package", id: :bigint, force: :cascade do |t|
    t.bigint   "package_type_id"
    t.datetime "purchase_date"
    t.datetime "activation_date"
    t.datetime "expiry_date"
    t.bigint   "invoice_id"
    t.datetime "createdon",           null: false
    t.datetime "last_update",         null: false
    t.text     "status"
    t.text     "reason"
    t.datetime "status_change_date"
    t.datetime "reason_change_date"
    t.bigint   "reason_change_by_id"
    t.bigint   "status_change_by_id"
    t.index ["invoice_id"], name: "ix_package_invoice_24", using: :btree
    t.index ["package_type_id"], name: "ix_package_packagetype_23", using: :btree
  end

  create_table "package_items", force: :cascade do |t|
    t.bigint "package_type_id", null: false
    t.bigint "item_id",         null: false
    t.bigint "quantity"
  end

  create_table "package_type", id: :bigint, force: :cascade do |t|
    t.string   "package_name",                      limit: 255
    t.integer  "month_duration"
    t.datetime "createdon",                                                                               null: false
    t.datetime "last_update",                                                                             null: false
    t.decimal  "package_duration"
    t.decimal  "package_cost",                                  precision: 10, scale: 2
    t.decimal  "breakup_tw",                                    precision: 10, scale: 2
    t.decimal  "breakup_tf",                                    precision: 10, scale: 2
    t.decimal  "max_freeze",                                    precision: 10, scale: 2
    t.boolean  "allow_downgrade",                                                        default: false,  null: false
    t.integer  "freezing_fees",                                                          default: 0,      null: false
    t.integer  "mrp",                                                                    default: 0,      null: false
    t.integer  "num_products",                                                           default: 0,      null: false
    t.integer  "num_sessions",                                                           default: 0,      null: false
    t.boolean  "food_only",                                                              default: false,  null: false
    t.decimal  "super_admin_max_freeze",                        precision: 10, scale: 2
    t.boolean  "is_active",                                                              default: false
    t.boolean  "should_give_detox",                                                      default: false
    t.boolean  "should_give_firstmonth",                                                 default: false
    t.text     "month_kit_codes",                                                                                      array: true
    t.decimal  "min_package_amount_new"
    t.decimal  "min_package_amount_renew"
    t.boolean  "is_maintenance",                                                         default: false,  null: false
    t.decimal  "approved_min_package_amount_new"
    t.decimal  "approved_min_package_amount_renew"
    t.integer  "max_premium_item_per_month"
    t.boolean  "billing_enabled",                                                        default: false
    t.string   "package_category",                                                       default: "GOLD"
    t.integer  "max_item_per_month"
    t.text     "exclude_criteria"
    t.decimal  "price_per_month"
    t.decimal  "detox_price"
    t.decimal  "offer_price_per_month"
    t.decimal  "first_time_lucky_per_month"
    t.text     "minimum_price_criterias"
    t.string   "package_subcategory"
    t.integer  "hsn_code"
    t.decimal  "maintanence_duration"
    t.boolean  "is_course",                                                              default: false
  end

  create_table "package_upgrade_recommendations", force: :cascade do |t|
    t.bigint   "package_type_id",                           null: false
    t.bigint   "upgradable_package_type_id",                null: false
    t.decimal  "cost_per_additional_month"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_active",                  default: true
    t.index ["package_type_id", "upgradable_package_type_id"], name: "unique_key_package_upgrade_recommendations", unique: true, using: :btree
  end

  create_table "pass_to_schedulers", force: :cascade do |t|
    t.text     "reason"
    t.string   "client_phone",         limit: 20
    t.text     "location_coordinates"
    t.string   "name_plate",           limit: 50
    t.string   "building_image",       limit: 50
    t.integer  "agent_id"
    t.integer  "visit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_details", force: :cascade do |t|
    t.bigint   "payment_id",        null: false
    t.decimal  "deposit_amount"
    t.date     "deposit_date"
    t.decimal  "credit_amount"
    t.date     "credit_date"
    t.decimal  "bank_charge"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "comments"
    t.text     "bank_reference_no"
    t.date     "bank_credit_date"
    t.text     "docket_no"
    t.index ["payment_id"], name: "index_payment_details_on_payment_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "bill_id",                                          null: false
    t.decimal  "amount",                                           null: false
    t.string   "payment_mode",                                     null: false
    t.string   "bank_name"
    t.string   "cc_no"
    t.string   "branch_name"
    t.string   "status",                          default: "PAID", null: false
    t.text     "comments"
    t.date     "cheque_date"
    t.date     "payment_date",                                     null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "payment_for",                                      null: false
    t.string   "update_log"
    t.string   "sales_activity_id"
    t.decimal  "employee1_share"
    t.decimal  "employee2_share"
    t.decimal  "employee3_share"
    t.decimal  "dietician_share"
    t.integer  "employee1"
    t.integer  "employee2"
    t.integer  "employee3"
    t.integer  "dietician"
    t.boolean  "cheque_cleared"
    t.date     "cheque_cleared_date"
    t.string   "rejection_reason"
    t.string   "writtenoff_reason"
    t.string   "payreq_id",           limit: 100
    t.date     "rejection_date"
    t.date     "writtenoff_date"
    t.text     "do_no"
    t.boolean  "do_valid"
    t.bigint   "payment_added_by"
    t.datetime "last_synced_ls"
    t.string   "name_in_approved_do"
    t.integer  "tenure"
    t.string   "transaction_id",      limit: 50
    t.string   "image_url",           limit: 200
    t.string   "image_url_two",       limit: 200
    t.boolean  "cheque_permitted"
    t.string   "reason_for_cheque",   limit: 100
    t.date     "cod_received_date"
    t.text     "status_update"
    t.index ["bill_id"], name: "index_payments_on_bill_id", using: :btree
    t.index ["status"], name: "status_idx", using: :btree
  end

  create_table "penalties", force: :cascade do |t|
    t.integer  "agent_id",                          null: false
    t.integer  "given_by_id",                       null: false
    t.integer  "penalty_type_id",                   null: false
    t.integer  "amount",                            null: false
    t.text     "comments"
    t.datetime "createdon",                         null: false
    t.datetime "last_update",                       null: false
    t.integer  "visit_id"
    t.date     "for_date"
    t.bigint   "client_id"
    t.boolean  "is_deleted",        default: false
    t.bigint   "deleted_by_id"
    t.string   "delete_reason"
    t.datetime "deleted_on_date"
    t.text     "reason_attachment"
    t.text     "lead_id"
  end

  create_table "penalty_types", force: :cascade do |t|
    t.string  "reason",  limit: 255, null: false
    t.integer "penalty",             null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string  "object",   limit: 254, null: false
    t.integer "group_id",             null: false
    t.index ["group_id", "object"], name: "idx_permissions_group_id_object", using: :btree
    t.index ["group_id", "object"], name: "permissions_group_id_object_key", unique: true, using: :btree
    t.index ["group_id"], name: "idx_permissions_group_id", using: :btree
    t.index ["object"], name: "idx_permissions_object", using: :btree
  end

  create_table "permissions_group", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "idx_permissions_group_name", using: :btree
    t.index ["name"], name: "unique_permissions_group_name", unique: true, using: :btree
  end

  create_table "permissions_group_membership", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
    t.index ["group_id", "user_id"], name: "idx_permissions_group_membership_group_id_user_id", using: :btree
    t.index ["group_id"], name: "idx_permissions_group_membership_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "unique_permissions_group_membership_user_id_group_id", unique: true, using: :btree
    t.index ["user_id"], name: "idx_permissions_group_membership_user_id", using: :btree
  end

  create_table "permissions_revision", force: :cascade, comment: "Used to keep track of changes made to permissions." do |t|
    t.text     "before",     null: false, comment: "Serialized JSON of the permissions before the changes."
    t.text     "after",      null: false, comment: "Serialized JSON of the permissions after the changes."
    t.integer  "user_id",    null: false, comment: "The ID of the admin who made this set of changes."
    t.datetime "created_at", null: false, comment: "The timestamp of when these changes were made."
    t.text     "remark",                  comment: "Optional remarks explaining why these changes were made."
  end

  create_table "pharmacy_client_coupons", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "phone"
    t.integer  "hc_promo_coupon_id"
    t.integer  "visit_id"
    t.text     "coupon_code"
    t.datetime "code_used_time"
    t.integer  "ls_task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_tasks", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "agent_email"
    t.integer  "agent_id"
    t.text     "status"
    t.datetime "followup_date"
    t.text     "interest_level"
    t.date     "expected_date"
    t.text     "expected_amount"
    t.text     "chance_of_payment"
    t.text     "ni_reason"
    t.text     "followup_type"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "call_type"
    t.integer  "ls_task_id"
    t.text     "ls_id"
    t.boolean  "call_exact_time",   default: false
    t.index ["lead_id"], name: "phone_tasks_lead_id_index", using: :btree
  end

  create_table "pincode_searches", force: :cascade do |t|
    t.integer  "pincode"
    t.json     "slot_data"
    t.integer  "total_slots"
    t.text     "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pinkathon_codes", id: false, force: :cascade do |t|
    t.string   "code",      limit: 20
    t.string   "name",      limit: 50
    t.bigint   "phone"
    t.string   "email",     limit: 50
    t.datetime "updatedon"
  end

  create_table "plan_designed_for_disease", id: :bigint, force: :cascade do |t|
    t.bigint   "master_diet_plan_id"
    t.bigint   "disease_id"
    t.datetime "createdon",           null: false
    t.datetime "last_update",         null: false
  end

  create_table "plan_not_recommended_for_disease", id: :bigint, force: :cascade do |t|
    t.bigint   "master_diet_plan_id"
    t.bigint   "disease_id"
    t.datetime "createdon",           null: false
    t.datetime "last_update",         null: false
  end

  create_table "play_evolutions", id: :integer, force: :cascade do |t|
    t.string   "hash",          limit: 255, null: false
    t.datetime "applied_at",                null: false
    t.text     "apply_script"
    t.text     "revert_script"
    t.string   "state",         limit: 255
    t.text     "last_problem"
  end

  create_table "point", id: :bigint, force: :cascade do |t|
    t.datetime "awarded_at"
    t.bigint   "config_name_id"
    t.text     "url"
    t.datetime "createdon",                       null: false
    t.datetime "last_update",                     null: false
    t.bigint   "dietician_id"
    t.bigint   "client_id"
    t.string   "category_for_points", limit: 255
    t.float    "points"
    t.float    "total_point"
  end

  create_table "point_config", id: :bigint, force: :cascade do |t|
    t.bigint   "comment_point"
    t.bigint   "weight"
    t.bigint   "diet_chart"
    t.bigint   "comment_due"
    t.bigint   "lab_test"
    t.bigint   "supplements"
    t.bigint   "weight_loss_per_kg"
    t.bigint   "milestone_first_time"
    t.bigint   "feedback_bonus_in_percent"
    t.bigint   "feedback_complain"
    t.bigint   "avg_wlbonus_in_percent"
    t.bigint   "avg_wlpenalty_in_percent"
    t.bigint   "renewals"
    t.bigint   "appointment_by_phone"
    t.bigint   "appointment_by_person"
    t.bigint   "refunds"
    t.bigint   "partial_walkin_per_convert"
    t.bigint   "case_study_to_paper"
    t.bigint   "case_study_to_website"
    t.datetime "createdon",                                    null: false
    t.datetime "last_update",                                  null: false
    t.bigint   "appointment_served"
    t.bigint   "unhappy_feedback"
    t.bigint   "success"
    t.bigint   "failure"
    t.float    "picture_upload"
    t.bigint   "diet_chart_due"
    t.bigint   "monthly_review"
    t.bigint   "dietician_not_losing_weight_report"
    t.bigint   "client_profile_completion"
    t.integer  "finish_my_day",                      limit: 2
    t.integer  "measurement_update",                 limit: 2
    t.integer  "appointment_close",                  limit: 2
    t.integer  "msg_to_dietician",                   limit: 2
  end

  create_table "post_bill_referral_generations", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "phone"
    t.bigint   "ls_task_id"
    t.text     "speak_about"
    t.text     "manage_to_succeed"
    t.text     "comments"
    t.datetime "followup_time"
    t.integer  "agent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preference_category", id: :bigint, force: :cascade do |t|
    t.text     "category"
    t.bigint   "food_id"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "prize_details", force: :cascade do |t|
    t.bigint   "winner_client"
    t.text     "month_year",                null: false
    t.string   "type",          limit: 100
    t.string   "description",   limit: 100
    t.datetime "createdon",                 null: false
    t.datetime "last_update",               null: false
  end

  create_table "product_banner_schedule", force: :cascade do |t|
    t.text     "category"
    t.text     "title"
    t.text     "redirection_link"
    t.text     "event_name"
    t.text     "banner_url"
    t.datetime "createdon"
    t.datetime "last_update"
    t.text     "banner_url_hi"
  end

  create_table "proformas", id: :bigserial, force: :cascade do |t|
    t.string   "lead_id",     limit: 100
    t.jsonb    "data",                                        null: false
    t.string   "status",      limit: 10,  default: "PENDING", null: false
    t.string   "payreq_id",   limit: 100
    t.datetime "createdon",                                   null: false
    t.datetime "last_update",                                 null: false
    t.integer  "bill_id"
  end

  create_table "program_details", force: :cascade do |t|
    t.json     "core_program_details"
    t.json     "maintenance_program_details"
    t.bigint   "package_type_id",             null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "program_category"
  end

  create_table "pulse", force: :cascade do |t|
    t.integer  "creator_id",                                      null: false
    t.string   "name",                limit: 254
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "skip_if_empty",                   default: false, null: false, comment: "Skip a scheduled Pulse if none of its questions have any results"
    t.string   "alert_condition",     limit: 254,                              comment: "Condition (i.e. \"rows\" or \"goal\") used as a guard for alerts"
    t.boolean  "alert_first_only",                                             comment: "True if the alert should be disabled after the first notification"
    t.boolean  "alert_above_goal",                                             comment: "For a goal condition, alert when above the goal"
    t.integer  "collection_id",                                                comment: "Options ID of Collection this Pulse belongs to."
    t.integer  "collection_position", limit: 2,                                comment: "Optional pinned position for this item in its Collection. NULL means item is not pinned."
    t.boolean  "archived",                        default: false,              comment: "Has this pulse been archived?"
    t.index ["collection_id"], name: "idx_pulse_collection_id", using: :btree
    t.index ["creator_id"], name: "idx_pulse_creator_id", using: :btree
  end

  create_table "pulse_card", force: :cascade do |t|
    t.integer "pulse_id",                    null: false
    t.integer "card_id",                     null: false
    t.integer "position",                    null: false
    t.boolean "include_csv", default: false, null: false, comment: "True if a CSV of the data should be included for this pulse card"
    t.boolean "include_xls", default: false, null: false, comment: "True if a XLS of the data should be included for this pulse card"
    t.index ["card_id"], name: "idx_pulse_card_card_id", using: :btree
    t.index ["pulse_id"], name: "idx_pulse_card_pulse_id", using: :btree
  end

  create_table "pulse_channel", force: :cascade do |t|
    t.integer  "pulse_id",                                 null: false
    t.string   "channel_type",   limit: 32,                null: false
    t.text     "details",                                  null: false
    t.string   "schedule_type",  limit: 32,                null: false
    t.integer  "schedule_hour"
    t.string   "schedule_day",   limit: 64
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "schedule_frame", limit: 32
    t.boolean  "enabled",                   default: true, null: false
    t.index ["pulse_id"], name: "idx_pulse_channel_pulse_id", using: :btree
    t.index ["schedule_type"], name: "idx_pulse_channel_schedule_type", using: :btree
  end

  create_table "pulse_channel_recipient", force: :cascade do |t|
    t.integer "pulse_channel_id", null: false
    t.integer "user_id",          null: false
  end

  create_table "push_notification", force: :cascade do |t|
    t.bigint   "client_id"
    t.string   "app_version", limit: 255
    t.string   "message_id",  limit: 255
    t.text     "message"
    t.string   "device_key",  limit: 255
    t.string   "status",      limit: 255
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "qrtz_blob_triggers", primary_key: ["sched_name", "trigger_name", "trigger_group"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string "sched_name",    limit: 120, null: false
    t.string "trigger_name",  limit: 200, null: false
    t.string "trigger_group", limit: 200, null: false
    t.binary "blob_data"
  end

  create_table "qrtz_calendars", primary_key: ["sched_name", "calendar_name"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string "sched_name",    limit: 120, null: false
    t.string "calendar_name", limit: 200, null: false
    t.binary "calendar",                  null: false
  end

  create_table "qrtz_cron_triggers", primary_key: ["sched_name", "trigger_name", "trigger_group"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string "sched_name",      limit: 120, null: false
    t.string "trigger_name",    limit: 200, null: false
    t.string "trigger_group",   limit: 200, null: false
    t.string "cron_expression", limit: 120, null: false
    t.string "time_zone_id",    limit: 80
  end

  create_table "qrtz_fired_triggers", primary_key: ["sched_name", "entry_id"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string  "sched_name",        limit: 120, null: false
    t.string  "entry_id",          limit: 95,  null: false
    t.string  "trigger_name",      limit: 200, null: false
    t.string  "trigger_group",     limit: 200, null: false
    t.string  "instance_name",     limit: 200, null: false
    t.bigint  "fired_time",                    null: false
    t.bigint  "sched_time"
    t.integer "priority",                      null: false
    t.string  "state",             limit: 16,  null: false
    t.string  "job_name",          limit: 200
    t.string  "job_group",         limit: 200
    t.boolean "is_nonconcurrent"
    t.boolean "requests_recovery"
    t.index ["sched_name", "instance_name", "requests_recovery"], name: "idx_qrtz_ft_inst_job_req_rcvry", using: :btree
    t.index ["sched_name", "instance_name"], name: "idx_qrtz_ft_trig_inst_name", using: :btree
    t.index ["sched_name", "job_group"], name: "idx_qrtz_ft_jg", using: :btree
    t.index ["sched_name", "job_name", "job_group"], name: "idx_qrtz_ft_j_g", using: :btree
    t.index ["sched_name", "trigger_group"], name: "idx_qrtz_ft_tg", using: :btree
    t.index ["sched_name", "trigger_name", "trigger_group"], name: "idx_qrtz_ft_t_g", using: :btree
  end

  create_table "qrtz_job_details", primary_key: ["sched_name", "job_name", "job_group"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string  "sched_name",        limit: 120, null: false
    t.string  "job_name",          limit: 200, null: false
    t.string  "job_group",         limit: 200, null: false
    t.string  "description",       limit: 250
    t.string  "job_class_name",    limit: 250, null: false
    t.boolean "is_durable",                    null: false
    t.boolean "is_nonconcurrent",              null: false
    t.boolean "is_update_data",                null: false
    t.boolean "requests_recovery",             null: false
    t.binary  "job_data"
    t.index ["sched_name", "job_group"], name: "idx_qrtz_j_grp", using: :btree
    t.index ["sched_name", "requests_recovery"], name: "idx_qrtz_j_req_recovery", using: :btree
  end

  create_table "qrtz_locks", primary_key: ["sched_name", "lock_name"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "lock_name",  limit: 40,  null: false
  end

  create_table "qrtz_paused_trigger_grps", primary_key: ["sched_name", "trigger_group"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string "sched_name",    limit: 120, null: false
    t.string "trigger_group", limit: 200, null: false
  end

  create_table "qrtz_scheduler_state", primary_key: ["sched_name", "instance_name"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string "sched_name",        limit: 120, null: false
    t.string "instance_name",     limit: 200, null: false
    t.bigint "last_checkin_time",             null: false
    t.bigint "checkin_interval",              null: false
  end

  create_table "qrtz_simple_triggers", primary_key: ["sched_name", "trigger_name", "trigger_group"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string "sched_name",      limit: 120, null: false
    t.string "trigger_name",    limit: 200, null: false
    t.string "trigger_group",   limit: 200, null: false
    t.bigint "repeat_count",                null: false
    t.bigint "repeat_interval",             null: false
    t.bigint "times_triggered",             null: false
  end

  create_table "qrtz_simprop_triggers", primary_key: ["sched_name", "trigger_name", "trigger_group"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string  "sched_name",    limit: 120,                          null: false
    t.string  "trigger_name",  limit: 200,                          null: false
    t.string  "trigger_group", limit: 200,                          null: false
    t.string  "str_prop_1",    limit: 512
    t.string  "str_prop_2",    limit: 512
    t.string  "str_prop_3",    limit: 512
    t.integer "int_prop_1"
    t.integer "int_prop_2"
    t.bigint  "long_prop_1"
    t.bigint  "long_prop_2"
    t.decimal "dec_prop_1",                precision: 13, scale: 4
    t.decimal "dec_prop_2",                precision: 13, scale: 4
    t.boolean "bool_prop_1"
    t.boolean "bool_prop_2"
  end

  create_table "qrtz_triggers", primary_key: ["sched_name", "trigger_name", "trigger_group"], force: :cascade, comment: "Used for Quartz scheduler." do |t|
    t.string  "sched_name",     limit: 120, null: false
    t.string  "trigger_name",   limit: 200, null: false
    t.string  "trigger_group",  limit: 200, null: false
    t.string  "job_name",       limit: 200, null: false
    t.string  "job_group",      limit: 200, null: false
    t.string  "description",    limit: 250
    t.bigint  "next_fire_time"
    t.bigint  "prev_fire_time"
    t.integer "priority"
    t.string  "trigger_state",  limit: 16,  null: false
    t.string  "trigger_type",   limit: 8,   null: false
    t.bigint  "start_time",                 null: false
    t.bigint  "end_time"
    t.string  "calendar_name",  limit: 200
    t.integer "misfire_instr",  limit: 2
    t.binary  "job_data"
    t.index ["sched_name", "calendar_name"], name: "idx_qrtz_t_c", using: :btree
    t.index ["sched_name", "job_group"], name: "idx_qrtz_t_jg", using: :btree
    t.index ["sched_name", "job_name", "job_group"], name: "idx_qrtz_t_j", using: :btree
    t.index ["sched_name", "misfire_instr", "next_fire_time", "trigger_group", "trigger_state"], name: "idx_qrtz_t_nft_st_misfire_grp", using: :btree
    t.index ["sched_name", "misfire_instr", "next_fire_time", "trigger_state"], name: "idx_qrtz_t_nft_st_misfire", using: :btree
    t.index ["sched_name", "misfire_instr", "next_fire_time"], name: "idx_qrtz_t_nft_misfire", using: :btree
    t.index ["sched_name", "next_fire_time"], name: "idx_qrtz_t_next_fire_time", using: :btree
    t.index ["sched_name", "trigger_group", "trigger_state"], name: "idx_qrtz_t_n_g_state", using: :btree
    t.index ["sched_name", "trigger_group"], name: "idx_qrtz_t_g", using: :btree
    t.index ["sched_name", "trigger_name", "trigger_group", "trigger_state"], name: "idx_qrtz_t_n_state", using: :btree
    t.index ["sched_name", "trigger_state", "next_fire_time"], name: "idx_qrtz_t_nft_st", using: :btree
    t.index ["sched_name", "trigger_state"], name: "idx_qrtz_t_state", using: :btree
  end

  create_table "query", primary_key: "query_hash", id: :binary, comment: "The hash of the query dictionary. (This is a 256-bit SHA3 hash of the query dict.)", force: :cascade, comment: "Information (such as average execution time) for different queries that have been previously ran." do |t|
    t.integer "average_execution_time", null: false, comment: "Average execution time for the query, round to nearest number of milliseconds. This is updated as a rolling average."
    t.text    "query",                               comment: "The actual \"query dictionary\" for this query."
  end

  create_table "query_cache", primary_key: "query_hash", id: :binary, comment: "The hash of the query dictionary. (This is a 256-bit SHA3 hash of the query dict).", force: :cascade, comment: "Cached results of queries are stored here when using the DB-based query cache." do |t|
    t.datetime "updated_at", null: false, comment: "The timestamp of when these query results were last refreshed."
    t.binary   "results",    null: false, comment: "Cached, compressed results of running the query with the given hash."
    t.index ["updated_at"], name: "idx_query_cache_updated_at", using: :btree
  end

  create_table "query_execution", force: :cascade, comment: "A log of executed queries, used for calculating historic execution times, auditing, and other purposes." do |t|
    t.binary   "hash",                    null: false, comment: "The hash of the query dictionary. This is a 256-bit SHA3 hash of the query."
    t.datetime "started_at",              null: false, comment: "Timestamp of when this query started running."
    t.integer  "running_time",            null: false, comment: "The time, in milliseconds, this query took to complete."
    t.integer  "result_rows",             null: false, comment: "Number of rows in the query results."
    t.boolean  "native",                  null: false, comment: "Whether the query was a native query, as opposed to an MBQL one (e.g., created with the GUI)."
    t.string   "context",      limit: 32,              comment: "Short string specifying how this query was executed, e.g. in a Dashboard or Pulse."
    t.text     "error",                                comment: "Error message returned by failed query, if any."
    t.integer  "executor_id",                          comment: "The ID of the User who triggered this query execution, if any."
    t.integer  "card_id",                              comment: "The ID of the Card (Question) associated with this query execution, if any."
    t.integer  "dashboard_id",                         comment: "The ID of the Dashboard associated with this query execution, if any."
    t.integer  "pulse_id",                             comment: "The ID of the Pulse associated with this query execution, if any."
    t.integer  "database_id",                          comment: "ID of the database this query was ran against."
    t.index ["hash", "started_at"], name: "idx_query_execution_query_hash_started_at", using: :btree
    t.index ["started_at"], name: "idx_query_execution_started_at", using: :btree
  end

  create_table "query_queryexecution", force: :cascade do |t|
    t.string   "uuid",            limit: 254, null: false
    t.integer  "version",                     null: false
    t.text     "json_query",                  null: false
    t.text     "raw_query",                   null: false
    t.string   "status",          limit: 254, null: false
    t.datetime "started_at",                  null: false
    t.datetime "finished_at"
    t.integer  "running_time",                null: false
    t.text     "error",                       null: false
    t.string   "result_file",     limit: 254, null: false
    t.integer  "result_rows",                 null: false
    t.text     "result_data",                 null: false
    t.text     "additional_info",             null: false
    t.integer  "executor_id"
    t.integer  "query_hash",                  null: false
    t.index ["executor_id"], name: "idx_queryexecution_executor_id", using: :btree
    t.index ["query_hash"], name: "idx_query_queryexecution_query_hash", using: :btree
    t.index ["started_at"], name: "idx_query_queryexecution_started_at", using: :btree
    t.index ["uuid"], name: "query_queryexecution_uuid_key", unique: true, using: :btree
  end

  create_table "question", id: :bigint, force: :cascade do |t|
    t.text     "verbiage",                                          null: false
    t.text     "content"
    t.text     "criteria"
    t.string   "question_type", limit: 20,                          null: false
    t.string   "frequency",     limit: 20
    t.datetime "display_from",             default: -> { "now()" }, null: false
    t.datetime "display_till"
    t.datetime "createdon",                default: -> { "now()" }, null: false
    t.string   "status",        limit: 20,                          null: false, comment: "ACTIVE"
    t.datetime "last_update",              default: -> { "now()" }, null: false
    t.integer  "qorder",                   default: 0,              null: false
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
    t.text     "question"
    t.string   "type",        limit: 256
  end

  create_table "razorpay_subscription_plans", force: :cascade do |t|
    t.text     "plan_id"
    t.integer  "package_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "razorpay_subscriptions", force: :cascade do |t|
    t.text     "subscription_id"
    t.jsonb    "data"
    t.text     "status"
    t.integer  "bill_id",         array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_preference", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "food_type"
    t.boolean  "is_skipped"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "recipes", force: :cascade do |t|
    t.text     "name"
    t.text     "thumbnail_url"
    t.text     "video_url"
    t.text     "description"
    t.text     "food_type"
    t.text     "diet_type"
    t.text     "categories"
    t.text     "ingredients"
    t.text     "time_to_cook"
    t.text     "complexity"
    t.integer  "healthy_scale"
    t.text     "type"
    t.integer  "no_of_serving"
    t.text     "steps_to_cook"
    t.datetime "createdon"
    t.datetime "last_update"
    t.integer  "video_durartion"
    t.text     "tags"
    t.text     "which_possible_product"
    t.bigint   "food_id"
  end

  create_table "referral_codes", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "referral_code"
    t.text     "referral_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "phone"
    t.text     "comments"
  end

  create_table "referral_generation_forms", force: :cascade do |t|
    t.text     "phone"
    t.text     "lead_id"
    t.integer  "ls_task_id"
    t.integer  "agent_id"
    t.text     "status"
    t.integer  "referrals_given"
    t.text     "comments"
    t.datetime "followup_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referral_lead_created_details", force: :cascade do |t|
    t.string   "lead_id",                                                    null: false
    t.string   "referral_phone_number",                                      null: false
    t.string   "referred_by_phone_number"
    t.date     "referred_date",                                              null: false
    t.boolean  "created_from_form"
    t.string   "referred_by_employee_email"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "referred_by_name"
    t.string   "referred_by_email"
    t.boolean  "is_dc_lead",                                 default: false
    t.string   "source"
    t.string   "main_intermediate_source"
    t.string   "dc_team_member_name"
    t.integer  "no_of_attempt"
    t.string   "lead_name"
    t.datetime "dc_team_member_added_date"
    t.integer  "no_of_spoken_calls"
    t.text     "city"
    t.text     "disposition"
    t.text     "subdisposition"
    t.date     "last_spoken_date"
    t.decimal  "bmi"
    t.text     "lead_owner_id"
    t.text     "notes"
    t.text     "referred_by_lead_id"
    t.boolean  "assign_to_hc",                               default: false
    t.string   "coach_call_status",              limit: 255
    t.text     "referral_type"
    t.text     "coach_referral_closing_comment"
    t.text     "referral_contacts"
    t.index ["referral_phone_number"], name: "referral_lead_created_details_ukey", unique: true, using: :btree
  end

  create_table "referral_renewal_details", id: :bigserial, force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "agent_id"
    t.date     "date"
    t.string   "reason",                limit: 20
    t.bigint   "bill_id"
    t.date     "penalty_given_date"
    t.string   "action",                limit: 64
    t.string   "reason_to_send_mail",   limit: 64
    t.string   "resource_url",          limit: 256
    t.date     "activation_date"
    t.datetime "createdon",                         default: -> { "now()" }, null: false
    t.datetime "last_update",                       default: -> { "now()" }, null: false
    t.text     "not_interested_reason"
  end

  create_table "reminder", force: :cascade do |t|
    t.text     "name"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "reminder_notification_tracker", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "reminder_id"
    t.datetime "time"
    t.text     "reminder_text"
    t.string   "type",          limit: 100
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "renewal_flow_leads", force: :cascade do |t|
    t.integer  "bill_id"
    t.text     "phone"
    t.date     "expiry_date"
    t.integer  "agent_id"
    t.boolean  "assigned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
    t.text     "lead_id"
    t.text     "bucket_type"
    t.text     "language",    array: true
  end

  create_table "reply_comment", id: :bigint, force: :cascade do |t|
    t.bigint   "comment_id"
    t.bigint   "commented_by_id"
    t.bigint   "commented_to_id"
    t.boolean  "reply_expected",  default: false
    t.text     "message"
    t.text     "url"
    t.datetime "commented_date"
    t.datetime "createdon",                       null: false
    t.datetime "last_update",                     null: false
    t.index ["comment_id"], name: "ix_reply_comment_comment_1", using: :btree
  end

  create_table "report_card", force: :cascade do |t|
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                   limit: 254,                 null: false
    t.text     "description"
    t.string   "display",                limit: 254,                 null: false
    t.text     "dataset_query",                                      null: false
    t.text     "visualization_settings",                             null: false
    t.integer  "creator_id",                                         null: false
    t.integer  "database_id"
    t.integer  "table_id"
    t.string   "query_type",             limit: 16
    t.boolean  "archived",                           default: false, null: false
    t.integer  "collection_id",                                                   comment: "Optional ID of Collection this Card belongs to."
    t.string   "public_uuid",            limit: 36,                               comment: "Unique UUID used to in publically-accessible links to this Card."
    t.integer  "made_public_by_id",                                               comment: "The ID of the User who first publically shared this Card."
    t.boolean  "enable_embedding",                   default: false, null: false, comment: "Is this Card allowed to be embedded in different websites (using a signed JWT)?"
    t.text     "embedding_params",                                                comment: "Serialized JSON containing information about required parameters that must be supplied when embedding this Card."
    t.integer  "cache_ttl",                                                       comment: "The maximum time, in seconds, to return cached results for this Card rather than running a new query."
    t.text     "result_metadata",                                                 comment: "Serialized JSON containing metadata about the result columns from running the query."
    t.text     "read_permissions",                                                comment: "Permissions required to view this Card and run its query."
    t.integer  "collection_position",    limit: 2,                                comment: "Optional pinned position for this item in its Collection. NULL means item is not pinned."
    t.index ["collection_id"], name: "idx_card_collection_id", using: :btree
    t.index ["creator_id"], name: "idx_card_creator_id", using: :btree
    t.index ["public_uuid"], name: "idx_card_public_uuid", using: :btree
    t.index ["public_uuid"], name: "report_card_public_uuid_key", unique: true, using: :btree
  end

  create_table "report_cardfavorite", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "card_id",    null: false
    t.integer  "owner_id",   null: false
    t.index ["card_id", "owner_id"], name: "idx_unique_cardfavorite_card_id_owner_id", unique: true, using: :btree
    t.index ["card_id"], name: "idx_cardfavorite_card_id", using: :btree
    t.index ["owner_id"], name: "idx_cardfavorite_owner_id", using: :btree
  end

  create_table "report_dashboard", force: :cascade do |t|
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "name",                    limit: 254,                 null: false
    t.text     "description"
    t.integer  "creator_id",                                          null: false
    t.text     "parameters",                                          null: false
    t.text     "points_of_interest"
    t.text     "caveats"
    t.boolean  "show_in_getting_started",             default: false, null: false
    t.string   "public_uuid",             limit: 36,                               comment: "Unique UUID used to in publically-accessible links to this Dashboard."
    t.integer  "made_public_by_id",                                                comment: "The ID of the User who first publically shared this Dashboard."
    t.boolean  "enable_embedding",                    default: false, null: false, comment: "Is this Dashboard allowed to be embedded in different websites (using a signed JWT)?"
    t.text     "embedding_params",                                                 comment: "Serialized JSON containing information about required parameters that must be supplied when embedding this Dashboard."
    t.boolean  "archived",                            default: false, null: false, comment: "Is this Dashboard archived (effectively treated as deleted?)"
    t.integer  "position",                                                         comment: "The position this Dashboard should appear in the Dashboards list, lower-numbered positions appearing before higher numbered ones."
    t.integer  "collection_id",                                                    comment: "Optional ID of Collection this Dashboard belongs to."
    t.integer  "collection_position",     limit: 2,                                comment: "Optional pinned position for this item in its Collection. NULL means item is not pinned."
    t.index ["collection_id"], name: "idx_dashboard_collection_id", using: :btree
    t.index ["creator_id"], name: "idx_dashboard_creator_id", using: :btree
    t.index ["public_uuid"], name: "idx_dashboard_public_uuid", using: :btree
    t.index ["public_uuid"], name: "report_dashboard_public_uuid_key", unique: true, using: :btree
    t.index ["show_in_getting_started"], name: "idx_report_dashboard_show_in_getting_started", using: :btree
  end

  create_table "report_dashboardcard", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "sizeX",                              null: false
    t.integer  "sizeY",                              null: false
    t.integer  "row",                    default: 0, null: false
    t.integer  "col",                    default: 0, null: false
    t.integer  "card_id"
    t.integer  "dashboard_id",                       null: false
    t.text     "parameter_mappings",                 null: false
    t.text     "visualization_settings",             null: false
    t.index ["card_id"], name: "idx_dashboardcard_card_id", using: :btree
    t.index ["dashboard_id"], name: "idx_dashboardcard_dashboard_id", using: :btree
  end

  create_table "revision", force: :cascade do |t|
    t.string   "model",        limit: 16,                 null: false
    t.integer  "model_id",                                null: false
    t.integer  "user_id",                                 null: false
    t.datetime "timestamp",                               null: false
    t.string   "object",                                  null: false
    t.boolean  "is_reversion",            default: false, null: false
    t.boolean  "is_creation",             default: false, null: false
    t.text     "message"
    t.index ["model", "model_id"], name: "idx_revision_model_model_id", using: :btree
  end

  create_table "sales_roles", force: :cascade do |t|
    t.string   "role"
    t.integer  "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segment", force: :cascade do |t|
    t.integer  "table_id",                                            null: false
    t.integer  "creator_id",                                          null: false
    t.string   "name",                    limit: 254,                 null: false
    t.text     "description"
    t.boolean  "archived",                            default: false, null: false
    t.text     "definition",                                          null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.text     "points_of_interest"
    t.text     "caveats"
    t.boolean  "show_in_getting_started",             default: false, null: false
    t.index ["creator_id"], name: "idx_segment_creator_id", using: :btree
    t.index ["show_in_getting_started"], name: "idx_segment_show_in_getting_started", using: :btree
    t.index ["table_id"], name: "idx_segment_table_id", using: :btree
  end

  create_table "serve_city", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "updated_at"
    t.integer  "team_lead_id"
  end

  create_table "servicable_pincodes", force: :cascade do |t|
    t.text     "pincode"
    t.text     "city"
    t.text     "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled",       default: true
    t.boolean  "cod_enabled",   default: false
    t.integer  "delivery_time"
    t.index ["enabled"], name: "idx_servicable_pincodes_enabled", using: :btree
  end

  create_table "setting", primary_key: "key", id: :string, limit: 254, force: :cascade do |t|
    t.text "value", null: false
  end

  create_table "sf_box_info", force: :cascade do |t|
    t.string   "box_type"
    t.decimal  "height"
    t.decimal  "width"
    t.decimal  "breadth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "weight_in_kgs"
  end

  create_table "sf_movement_details", primary_key: "movement_group_id", id: :bigserial, force: :cascade do |t|
    t.boolean  "is_active",                            default: true
    t.boolean  "is_deleted",                           default: false
    t.boolean  "is_freezed",                           default: false
    t.integer  "total_sf"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "receiver_phone_no",        limit: 255
    t.string   "receiver_email",           limit: 255
    t.string   "receiver_name",            limit: 255
    t.integer  "sender_agent_id"
    t.string   "sender_node_type",         limit: 30
    t.integer  "sender_node_id"
    t.date     "sender_date"
    t.integer  "receiver_agent_id"
    t.string   "receiver_node_type",       limit: 30
    t.integer  "receiver_node_id"
    t.date     "receiver_date"
    t.string   "status",                   limit: 30
    t.text     "comments"
    t.string   "courier_name",             limit: 255
    t.string   "tracking_id",              limit: 255
    t.integer  "requestor_id"
    t.integer  "transaction_id"
    t.date     "entry_date"
    t.date     "due_date"
    t.text     "address"
    t.string   "city",                     limit: 255
    t.string   "courier_status"
    t.datetime "delivery_date"
    t.string   "update_log"
    t.text     "request_type",                         default: "GENERAL"
    t.boolean  "sms_sent",                             default: false
    t.datetime "status_updated_at"
    t.boolean  "send_to_unicommerce",                  default: false
    t.boolean  "approved_by_client",                   default: false
    t.boolean  "approved_by_coach",                    default: false
    t.date     "returned_back_date"
    t.text     "invoice_no"
    t.date     "invoice_date"
    t.date     "expiry_date"
    t.text     "batch_no"
    t.text     "rate"
    t.text     "amount"
    t.text     "gst"
    t.text     "transport"
    t.date     "estimated_delivery_date"
    t.text     "actual_courier"
    t.text     "courier_comments"
    t.boolean  "delivery_whatsapp_send",               default: false
    t.text     "shipping_id_courier"
    t.text     "order_id_courier"
    t.integer  "additional_bill_ids",                                                   array: true
    t.text     "kit_code"
    t.text     "paid_bill_not_add_reason"
    t.index ["movement_group_id"], name: "index_sf_movement_details_on_movement_group_id", using: :btree
  end

  create_table "sf_movement_history", force: :cascade do |t|
    t.bigint   "sf_movement_group_id",   null: false
    t.bigint   "inventory_movement_id",  null: false
    t.bigint   "inventory_node_item_id", null: false
    t.integer  "qty_before_movement"
    t.integer  "qty_after_movement"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sf_quantity_histories", force: :cascade do |t|
    t.text     "sf_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shadow_visit", force: :cascade do |t|
    t.bigint   "done_by"
    t.string   "phone_number",        limit: 20
    t.text     "learning_suggestion"
    t.datetime "createdon"
    t.datetime "last_update"
  end

  create_table "share_text", force: :cascade do |t|
    t.string   "key",         limit: 100
    t.text     "value"
    t.string   "code",        limit: 20
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "shipping_address", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "address1"
    t.text     "address2"
    t.string   "city",          limit: 255
    t.bigint   "postal_code"
    t.string   "state",         limit: 255
    t.datetime "createdon"
    t.datetime "last_update"
    t.string   "country",       limit: 255
    t.string   "reason",        limit: 20
    t.bigint   "updated_by_id",             null: false
    t.index ["client_id"], name: "shipping_address_client_id_uq", unique: true, using: :btree
  end

  create_table "shopify_bundle_items", force: :cascade do |t|
    t.bigint   "shopify_bundle_id", null: false
    t.bigint   "item_id",           null: false
    t.integer  "quantity"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "shopify_bundles", force: :cascade do |t|
    t.string   "name"
    t.decimal  "mrp"
    t.decimal  "selling_price"
    t.bigint   "variant_id"
    t.boolean  "is_a_package",    default: false
    t.bigint   "package_type_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "no_of_items"
    t.integer  "month_duration",  default: 0
  end

  create_table "shopify_webhooks", id: :bigserial, force: :cascade do |t|
    t.json     "data",                                       null: false
    t.string   "status",      limit: 10, default: "PENDING", null: false
    t.datetime "createdon",                                  null: false
    t.datetime "last_update",                                null: false
    t.bigint   "bill_id",                                                 array: true
  end

  create_table "short_link_campaigns", force: :cascade do |t|
    t.string  "url",         limit: 255
    t.integer "activity_id"
    t.string  "sms",         limit: 400,                    null: false
    t.text    "lead_fields",                                             array: true
    t.jsonb   "links"
    t.string  "sms_header",  limit: 10,  default: "POSSBL"
  end

  create_table "similar_recipes", force: :cascade do |t|
    t.bigint "food_id"
    t.text   "tags"
  end

  create_table "sms_short_links", force: :cascade do |t|
    t.text     "phone"
    t.text     "sms_type"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_media_review", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "review_given"
    t.bigint   "updated_by"
    t.datetime "createdon"
    t.datetime "last_update"
    t.text     "comment"
  end

  create_table "specialization", id: :bigserial, force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "stock_audits", force: :cascade do |t|
    t.integer  "inventory_node_id",                           null: false
    t.integer  "item_id",                                     null: false
    t.integer  "audit_quantity",     default: 0,              null: false
    t.date     "entry_date",         default: -> { "now()" }
    t.date     "filled_on_date"
    t.string   "reason"
    t.string   "additional_comment"
    t.integer  "audit_group_id",                              null: false
    t.boolean  "is_submitted",       default: false
    t.integer  "filled_by"
    t.integer  "difference"
    t.integer  "software_quantity"
    t.datetime "last_update",        default: -> { "now()" }
    t.integer  "expired_quantity"
    t.datetime "audit_date_time"
    t.index ["audit_group_id"], name: "index_stock_audit_on_audit_group_id", using: :btree
    t.index ["inventory_node_id"], name: "index_stock_audit_on_inventory_node_id", using: :btree
    t.index ["item_id"], name: "index_stock_audit_on_item_id", using: :btree
  end

  create_table "submitted_mock_form", force: :cascade do |t|
    t.text     "form_name"
    t.bigint   "question_id"
    t.float    "score"
    t.datetime "createdon"
    t.datetime "last_update"
    t.bigint   "submitted_form_id"
  end

  create_table "submitted_mock_form_report", force: :cascade do |t|
    t.text     "form_name"
    t.text     "team_name"
    t.float    "avg_score"
    t.bigint   "submitted_by"
    t.bigint   "submitted_for"
    t.bigint   "updated_by"
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "is_deleted"
    t.text     "suggestions"
    t.text     "scoring_type"
    t.text     "call_link"
    t.text     "client_name"
    t.string   "call_duration",          limit: 64
    t.bigint   "client_id"
    t.bigint   "visit_id"
    t.integer  "tutorial_video_id"
    t.string   "fatal",                  limit: 10
    t.string   "phone_no",               limit: 20
    t.text     "why_call_fatal_or_semi"
    t.index ["submitted_for"], name: "submitted_for_idx", using: :btree
  end

  create_table "subtitle", force: :cascade do |t|
    t.text     "subtitle_url"
    t.text     "language"
    t.text     "reference_type"
    t.bigint   "reference_id"
    t.datetime "createdon"
    t.datetime "last_update"
    t.text     "vtt_subtitle"
  end

  create_table "success_report_transfer_client", id: :bigint, force: :cascade do |t|
    t.bigint   "dietician_id"
    t.text     "client_ids"
    t.datetime "createdon",    null: false
    t.datetime "last_update",  null: false
  end

  create_table "suggestion", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id"
    t.boolean  "is_thyroid_client_have_lab"
    t.boolean  "is_diabetes_client_have_lab"
    t.float    "total_protien"
    t.float    "total_fibre"
    t.float    "total_sugar"
    t.float    "total_fat"
    t.integer  "no_of_free_foods"
    t.integer  "no_of_unhealthy_foods"
    t.float    "total_excercise_per"
    t.integer  "total_salad_taken"
    t.float    "total_protien_for_seven_days"
    t.float    "total_fibre_for_seven_days"
    t.float    "total_sugar_for_seven_days"
    t.float    "total_fat_for_seven_days"
    t.integer  "no_of_free_foods_for_seven_days"
    t.integer  "no_of_unhealthy_foods_for_seven_days"
    t.float    "excercise_per_for_seven_days"
    t.integer  "salad_taken_for_seven_days"
    t.integer  "total_logs"
    t.datetime "createdon",                                                    null: false
    t.datetime "last_update",                                                  null: false
    t.float    "total_health_dollar_consumption"
    t.float    "total_crab"
    t.float    "total_sprouts"
    t.float    "total_fruits"
    t.float    "total_shake_with_water"
    t.float    "total_shake_with_milk"
    t.float    "total_vegetable_juice"
    t.float    "total_buttermilk"
    t.float    "total_alcohol"
    t.float    "total_egg"
    t.float    "total_brown_rice"
    t.float    "total_super_fiber"
    t.float    "total_health_dollar_consumption_for_seven_days"
    t.float    "total_crab_for_seven_days"
    t.float    "total_sprouts_for_seven_days"
    t.float    "total_fruits_for_seven_days"
    t.float    "total_shake_with_water_for_seven_days"
    t.float    "total_shake_with_milk_for_seven_days"
    t.float    "total_vegetable_juice_for_seven_days"
    t.float    "total_buttermilk_for_seven_days"
    t.float    "total_alcohol_for_seven_days"
    t.float    "total_egg_for_seven_days"
    t.float    "total_brown_rice_for_seven_days"
    t.float    "total_super_fiber_for_seven_days"
    t.float    "exe_duration"
    t.bigint   "exe_duration_for_seven_days"
    t.integer  "total_tru_fibre_for_seven_days",                 default: 0
    t.integer  "total_hibiscus_teatox_for_seven_days",           default: 0
    t.integer  "total_dry_fruits_or_nuts_for_seven_days",        default: 0
    t.integer  "total_egg_white_for_seven_days",                 default: 0
    t.integer  "total_finish_days_in_last_seven_days",           default: 0
    t.text     "tips"
    t.float    "total_tru_fiber",                                default: 0.0
    t.index ["client_id"], name: "suggestion_client_id_key", unique: true, using: :btree
    t.index ["client_id"], name: "suggestion_index_client_id", using: :btree
  end

  create_table "super_food", id: :bigint, force: :cascade do |t|
    t.string   "food_name",             limit: 255
    t.datetime "createdon",                          null: false
    t.datetime "last_update",                        null: false
    t.string   "shopify_thumbnail_url", limit: 1024
    t.bigint   "shopify_amount"
    t.string   "shopify_page_url",      limit: 1024
    t.integer  "food_id"
  end

  create_table "super_food_kit_due", force: :cascade do |t|
    t.string   "month_kit_code"
    t.datetime "due_date"
    t.bigint   "client_id"
    t.bigint   "bill_id"
    t.datetime "createdon",                  null: false
    t.datetime "last_update",                null: false
    t.string   "comment",        limit: 255
    t.index ["client_id"], name: "super_food_kit_due_client_id", using: :btree
  end

  create_table "supermetrics", force: :cascade do |t|
    t.decimal  "spends"
    t.decimal  "impression"
    t.decimal  "clicks"
    t.decimal  "ctr"
    t.decimal  "leads"
    t.decimal  "cost_per_lead"
    t.text     "source"
    t.text     "campaign"
    t.decimal  "cpc"
    t.date     "report_date"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "supplement", id: :bigint, force: :cascade do |t|
    t.bigint   "assigned_by_id"
    t.string   "name",            limit: 255
    t.string   "dosage",          limit: 255
    t.string   "duration",        limit: 255
    t.datetime "assign_date"
    t.datetime "createdon",                   null: false
    t.datetime "last_update",                 null: false
    t.bigint   "client_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "when_to_take"
    t.text     "notes_to_client"
    t.text     "tool_tip"
    t.index ["client_id"], name: "ix_supplement_client_25", using: :btree
  end

  create_table "supplement_details", force: :cascade do |t|
    t.bigint   "item_id"
    t.text     "lab_parameter"
    t.text     "symptom"
    t.text     "disease"
    t.text     "not_good_for"
    t.string   "duration",         limit: 50
    t.string   "dosage",           limit: 50
    t.string   "when_to_take",     limit: 50
    t.datetime "createdon"
    t.datetime "last_update"
    t.text     "supplement_names"
    t.text     "banner_url"
  end

  create_table "survey_monkey_details", force: :cascade do |t|
    t.string   "survey_title"
    t.string   "survey_link"
    t.string   "survey_id"
    t.text     "custom_variables",               array: true
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "survey_related_to"
    t.integer  "activity_id"
    t.boolean  "is_survey_active"
    t.index ["survey_id"], name: "unique_key_survey_monkey_details_survey_id", unique: true, using: :btree
    t.index ["survey_link"], name: "unique_key_survey_monkey_details_survey_link", unique: true, using: :btree
  end

  create_table "symptoms", id: :bigint, force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "system_setting", force: :cascade do |t|
    t.text     "key"
    t.text     "value"
    t.datetime "createdon"
    t.datetime "last_update"
    t.text     "category"
  end

  create_table "talktime_additions", force: :cascade do |t|
    t.text     "phone"
    t.integer  "agent_id"
    t.integer  "added_by"
    t.integer  "duration"
    t.datetime "call_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url",  limit: 1000
  end

  create_table "task_history", force: :cascade, comment: "Timing and metadata info about background/quartz processes" do |t|
    t.string   "task",         limit: 254, null: false, comment: "Name of the task"
    t.integer  "db_id"
    t.datetime "started_at",               null: false
    t.datetime "ended_at",                 null: false
    t.integer  "duration",                 null: false
    t.text     "task_details",                          comment: "JSON string with additional info on the task"
    t.index ["db_id"], name: "idx_task_history_db_id", using: :btree
    t.index ["ended_at"], name: "idx_task_history_end_time", using: :btree
  end

  create_table "tc_incentives", force: :cascade do |t|
    t.integer  "agent_id",          null: false
    t.integer  "given_by_id",       null: false
    t.integer  "incentive_type_id", null: false
    t.integer  "amount"
    t.text     "comments"
    t.bigint   "visit_id"
    t.date     "for_date"
    t.bigint   "client_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "team", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.bigint   "tl_id"
    t.boolean  "is_sales_team", default: false
    t.boolean  "deleted"
    t.integer  "deleted_by"
  end

  create_table "team_center", force: :cascade do |t|
    t.bigint   "team_id",    null: false
    t.bigint   "center_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_targets", force: :cascade do |t|
    t.integer  "team_id",                                null: false
    t.string   "month_year"
    t.bigint   "target"
    t.date     "entry_date",    default: -> { "now()" }
    t.bigint   "target_set_by"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "telecaller", id: :bigint, force: :cascade do |t|
    t.bigint   "app_user_id"
    t.string   "experience",  limit: 255
    t.text     "company"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "telephony_agents", id: false, force: :cascade do |t|
    t.text "name"
  end

  create_table "telephony_connector", id: :bigserial, force: :cascade do |t|
    t.bigint   "agent_number"
    t.bigint   "customer_number"
    t.bigint   "agent_call_duration"
    t.bigint   "customer_call_duration"
    t.string   "calling_method",            limit: 32
    t.string   "customer_status",           limit: 32
    t.text     "resource_url"
    t.datetime "createdon",                            null: false
    t.datetime "last_update",                          null: false
    t.datetime "date_time"
    t.text     "call_id"
    t.string   "agent_status",              limit: 20
    t.string   "vendor_name",               limit: 20
    t.string   "called_number_by_customer", limit: 15
    t.string   "agent_list",                limit: 32
    t.string   "call_type",                 limit: 32
    t.index ["customer_number", "date_time", "customer_call_duration"], name: "telephony_duplicate_check", using: :btree
  end

  create_table "telephony_detail", primary_key: "date_ext", id: :string, limit: 255, force: :cascade do |t|
    t.string  "tc_name",                   limit: 255
    t.string  "campaign_mapped",           limit: 255
    t.bigint  "visit_scheduled"
    t.bigint  "talk_time"
    t.bigint  "spoken_call"
    t.bigint  "spoken_leads"
    t.date    "report_date"
    t.bigint  "ext_no"
    t.float   "visit_scheduled_percent"
    t.bigint  "leads_moved_to_calender",               default: 0
    t.bigint  "leads_met",                             default: 0
    t.bigint  "leads_sold",                            default: 0
    t.string  "team",                      limit: 255
    t.text    "tc_email"
    t.integer "tc_agent_id"
    t.integer "avg_spoken_time"
    t.integer "new_leads_visit_scheduled"
    t.boolean "tc_present"
    t.integer "reschedule_after_10_days",              default: 0
    t.integer "reschedule_within_10_days"
  end

  create_table "temp_hc_transfers", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "agent_email"
    t.boolean  "task_created"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temp_table", id: false, force: :cascade do |t|
    t.string "dietician_name",            limit: 255
    t.bigint "referral_amount"
    t.bigint "renewal_amount"
    t.bigint "partial_walkin_amount"
    t.bigint "total_of_referral_renewal"
  end

  create_table "temp_topic", force: :cascade do |t|
    t.bigint "app_user_id"
    t.text   "before_img"
    t.text   "after_img"
  end

  create_table "tempdata", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "track_no"
    t.string "foodtype", limit: 255
  end

  create_table "testimonial_category", force: :cascade do |t|
    t.text     "category"
    t.datetime "createdon",   null: false
    t.datetime "last_update", null: false
  end

  create_table "testimonial_clients", force: :cascade do |t|
    t.text     "client_name"
    t.bigint   "testimonial_category_id"
    t.boolean  "is_show",                 default: true
    t.datetime "createdon",                              null: false
    t.datetime "last_update",                            null: false
  end

  create_table "thyrocare_lab_details", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "client_id"
    t.text     "test_code"
    t.text     "test_type"
    t.jsonb    "request_data"
    t.jsonb    "response_data"
    t.integer  "agent_id"
    t.text     "payment_mode"
    t.text     "order_id"
    t.datetime "appoinment_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incentive"
    t.boolean  "report_generated",  default: false
    t.boolean  "is_canceled",       default: false
    t.integer  "collection_amount"
  end

  create_table "thyrocare_lab_reports", force: :cascade do |t|
    t.text     "mobile"
    t.text     "order_id"
    t.text     "order_no"
    t.text     "lead_id"
    t.date     "report_date"
    t.text     "xml_url"
    t.text     "pdf_url"
    t.datetime "client_medical_info_updated"
    t.datetime "createdon",                   null: false
    t.datetime "last_update",                 null: false
    t.bigint   "client_medical_info_id"
    t.integer  "collection_amount"
  end

  create_table "tip_of_the_day", force: :cascade do |t|
    t.string   "tip",         limit: 1024
    t.datetime "createdon",                null: false
    t.datetime "last_update",              null: false
    t.string   "category",    limit: 50
  end

  create_table "track_lead", force: :cascade do |t|
    t.string   "lead_id",              limit: 255
    t.string   "name",                 limit: 255
    t.string   "category",             limit: 255
    t.string   "city_consulation",     limit: 255
    t.string   "tc_agent",             limit: 255
    t.string   "tl_agent",             limit: 255
    t.string   "hc_agent",             limit: 255
    t.string   "scheduler_agent",      limit: 255
    t.date     "appointment_date"
    t.time     "appointment_time"
    t.string   "disposition",          limit: 255
    t.string   "subdisposition",       limit: 255
    t.string   "appointment_status",   limit: 255
    t.string   "double_confirmed",     limit: 255
    t.date     "last_spoken_date"
    t.string   "phone_no",             limit: 255
    t.string   "entity_type",          limit: 255
    t.date     "entity_id"
    t.boolean  "correction_status",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "referrer_score"
    t.text     "referrer_performance"
    t.string   "latest_task_status",   limit: 255
    t.string   "latest_task_type",     limit: 255
    t.string   "latest_task_owner",    limit: 255
    t.date     "latest_task_date"
    t.text     "resolved"
    t.text     "correction_comments"
    t.text     "resolved_by"
    t.datetime "resolved_at"
  end

  create_table "track_lead_referral", primary_key: "entity_date", id: :date, force: :cascade do |t|
  end

  create_table "track_lead_scheduler_today", primary_key: "entity_date", id: :date, force: :cascade do |t|
  end

  create_table "track_lead_scheduler_tomorrow", primary_key: "entity_date", id: :date, force: :cascade do |t|
  end

  create_table "track_lead_scheduler_yesterday", primary_key: "entity_date", id: :date, force: :cascade do |t|
  end

  create_table "track_lead_tc", primary_key: "entity_date", id: :date, force: :cascade do |t|
  end

  create_table "track_lead_today_visit_bookeds", force: :cascade do |t|
    t.date     "entity_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "transformation_journey", force: :cascade do |t|
    t.bigint   "client_id",                null: false
    t.string   "pic_url",     limit: 1024
    t.date     "for_date",                 null: false
    t.datetime "createdon",                null: false
    t.datetime "last_update",              null: false
  end

  create_table "transformation_posts", force: :cascade do |t|
    t.bigint   "app_user_id"
    t.text     "client_name"
    t.datetime "createdon",    null: false
    t.datetime "last_update",  null: false
    t.date     "posted_on"
    t.text     "post_content"
    t.text     "before_img"
    t.text     "after_img"
  end

  create_table "trial_video_tutorial", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "video_id"
    t.datetime "createdon",       null: false
    t.datetime "last_update",     null: false
    t.decimal  "played_duration"
  end

  create_table "tru_factor_scales", force: :cascade do |t|
    t.integer  "trufactor_value",   limit: 2
    t.float    "fat_hdf"
    t.float    "carb_hdf"
    t.float    "micronutrient_hdf"
    t.float    "other_hdf"
    t.datetime "createdon",                   null: false
    t.datetime "last_update",                 null: false
  end

  create_table "tutorial_video_categories", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at"
    t.boolean  "is_active",  default: false
  end

  create_table "tutorial_video_recordings", force: :cascade do |t|
    t.integer  "agent_id",             limit: 2
    t.integer  "tutorial_video_id"
    t.text     "recording_url"
    t.text     "recording_name"
    t.integer  "duration"
    t.integer  "self_eval_score",      limit: 2
    t.integer  "eval_score",           limit: 2
    t.integer  "evaluation_done_by"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at"
    t.boolean  "ask_mgr_eval"
    t.date     "manager_evaluated_on"
    t.text     "status",                         default: "Self Evaluation Pending"
  end

  create_table "tutorial_video_statuses", force: :cascade do |t|
    t.integer  "agent_id",          limit: 2
    t.integer  "tutorial_video_id"
    t.integer  "played_duration"
    t.boolean  "is_complete"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at"
  end

  create_table "tutorial_videos", force: :cascade do |t|
    t.integer  "tutorial_video_category_id"
    t.text     "video_url"
    t.text     "thumbnail_url"
    t.integer  "duration"
    t.text     "title"
    t.text     "description"
    t.text     "mock_form_report_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at"
    t.integer  "video_level"
    t.text     "tutorial_type"
    t.boolean  "disabled",                   default: false
    t.text     "external_video_url"
    t.integer  "priority"
  end

  create_table "tw_features", id: :bigint, force: :cascade do |t|
    t.string  "feature_type", limit: 250
    t.boolean "is_enable",                default: false, null: false
  end

  create_table "user_activity", id: :bigint, force: :cascade do |t|
    t.string   "ip_address",  limit: 100
    t.string   "url",         limit: 255
    t.string   "method",      limit: 10
    t.string   "app_user",    limit: 100
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
    t.bigint   "flag"
    t.bigint   "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "valid_cities", force: :cascade do |t|
    t.text     "city"
    t.text     "main_city"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "version_check", primary_key: ["platform", "app_version"], force: :cascade do |t|
    t.string  "platform",          limit: 20,                 null: false
    t.string  "app_version",       limit: 20,                 null: false
    t.boolean "upgrade_available",            default: false, null: false
    t.boolean "force_upgrade",                default: false, null: false
  end

  create_table "video_consultation_tasks", force: :cascade do |t|
    t.text     "lead_id"
    t.text     "agent_email"
    t.integer  "agent_id"
    t.text     "status"
    t.datetime "followup_date"
    t.text     "interest_level"
    t.date     "expected_date"
    t.text     "expected_amount"
    t.text     "chance_of_payment"
    t.text     "ni_reason"
    t.text     "followup_type"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "call_type"
    t.integer  "ls_task_id"
    t.integer  "duration"
  end

  create_table "video_course", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.datetime "createdon",                        null: false
    t.datetime "last_update",                      null: false
    t.text     "default_thumbnail"
    t.text     "not_enroll_thumbnail"
    t.float    "total_rating"
    t.bigint   "user_enrolled"
  end

  create_table "video_course_tracker", force: :cascade do |t|
    t.bigint   "client_id",       null: false
    t.bigint   "video_id",        null: false
    t.datetime "createdon",       null: false
    t.datetime "last_update",     null: false
    t.float    "played_duration"
    t.float    "video_duration"
    t.integer  "watch_percent"
    t.boolean  "is_completed"
    t.boolean  "has_liked"
    t.text     "language"
  end

  create_table "video_learning", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "video_id"
    t.text     "question_answer"
    t.datetime "createdon",       null: false
    t.datetime "last_update",     null: false
  end

  create_table "video_tasks", force: :cascade do |t|
    t.integer  "tutorial_video_id"
    t.integer  "agent_id"
    t.integer  "assignee_agent_id"
    t.string   "status"
    t.datetime "assignment_date"
    t.datetime "completed_on"
    t.datetime "created_at",        null: false
    t.datetime "updated_at"
  end

  create_table "video_tutorial", force: :cascade do |t|
    t.bigint   "client_id"
    t.integer  "video_id"
    t.datetime "createdon",             null: false
    t.datetime "last_update",           null: false
    t.float    "video_played_duration"
    t.boolean  "is_video_completed"
    t.integer  "level"
  end

  create_table "video_tutorial_backup", force: :cascade do |t|
    t.bigint   "client_id"
    t.integer  "video_id"
    t.datetime "createdon"
    t.datetime "last_update"
    t.float    "video_played_duration"
    t.boolean  "is_video_completed"
    t.integer  "level"
  end

  create_table "video_watch_logs", force: :cascade do |t|
    t.integer  "client_id",          null: false
    t.integer  "video_id",           null: false
    t.integer  "total_video_played", null: false
    t.integer  "diff_played",        null: false
    t.date     "log_date",           null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "video_watch_logs_backup", force: :cascade do |t|
    t.integer  "client_id",          null: false
    t.integer  "video_id",           null: false
    t.integer  "total_video_played", null: false
    t.integer  "diff_played",        null: false
    t.date     "log_date",           null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "createdon",                       null: false
    t.datetime "last_update",                     null: false
    t.text     "video_url"
    t.float    "duration"
    t.text     "title"
    t.text     "description"
    t.integer  "level"
    t.text     "category"
    t.integer  "start_showing_day"
    t.text     "form_name"
    t.text     "thumbnil_url"
    t.bigint   "diet_phase_id"
    t.string   "small_thumbnail_url", limit: 512
    t.string   "assigned_type",       limit: 50,  null: false
    t.text     "habit_ids"
    t.text     "old_video_url"
    t.bigint   "video_course_id"
    t.text     "language"
    t.bigint   "challenge_id"
    t.bigint   "coins_type_id"
    t.text     "url_with_subtitle"
    t.text     "thumbnil_url_hi"
  end

  create_table "view_log", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "model",     limit: 16, null: false
    t.integer  "model_id",             null: false
    t.datetime "timestamp",            null: false
    t.index ["model_id"], name: "idx_view_log_timestamp", using: :btree
    t.index ["user_id"], name: "idx_view_log_user_id", using: :btree
  end

  create_table "visit_doctor_form", force: :cascade do |t|
    t.bigint   "spoken_by_id", null: false
    t.bigint   "visit_id",     null: false
    t.text     "comments"
    t.bigint   "disease_ids",               array: true
    t.date     "spoken_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "visit_slots", force: :cascade do |t|
    t.string   "slot_name"
    t.time     "start_at",                     null: false
    t.integer  "slot_duration",                null: false
    t.time     "end_at",                       null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_active",     default: true
  end

  create_table "visits", force: :cascade do |t|
    t.string   "lead_id",                          limit: 50,                  null: false
    t.string   "lead_name",                        limit: 255
    t.string   "city",                             limit: 50
    t.date     "appointment_date"
    t.date     "appointment_booking_date"
    t.text     "booked_by"
    t.text     "allotted_to"
    t.string   "appointment_type",                 limit: 50
    t.string   "visited",                          limit: 4
    t.string   "converted",                        limit: 4
    t.string   "pushed_to_vymo",                   limit: 4
    t.string   "reason_for_cancel",                limit: 200
    t.text     "comments"
    t.string   "visit_happened",                   limit: 4
    t.string   "agent_on_time",                    limit: 4
    t.string   "bmi_done",                         limit: 4
    t.string   "wearing_tw_shirt",                 limit: 4
    t.string   "products_shown",                   limit: 4
    t.string   "collateral_given",                 limit: 4
    t.string   "program_explained",                limit: 4
    t.integer  "rating"
    t.string   "did_you_cancel",                   limit: 4
    t.string   "want_to_rebook",                   limit: 4
    t.datetime "rebook_datetime"
    t.text     "feedback_comments"
    t.integer  "penalty"
    t.string   "penalty_employee",                 limit: 50
    t.text     "penalty_reason"
    t.datetime "feedback_at"
    t.datetime "createdon",                                                    null: false
    t.datetime "last_update",                                                  null: false
    t.string   "vymo_status",                      limit: 50
    t.string   "vymo_id",                          limit: 30
    t.string   "email",                            limit: 100
    t.text     "appointment_time"
    t.string   "center",                           limit: 50
    t.integer  "feedback_by_id"
    t.text     "willing_to_enroll"
    t.string   "enroll_when",                      limit: 255
    t.string   "enroll_why_not",                   limit: 100
    t.integer  "feedback_counter",                             default: 0
    t.text     "phone"
    t.text     "tl_comments"
    t.string   "reason_for_not_interested",        limit: 60
    t.string   "level_of_interest",                limit: 60
    t.text     "activity_history"
    t.float    "weight"
    t.text     "height"
    t.datetime "first_appt_date"
    t.text     "address"
    t.integer  "pincode"
    t.datetime "actual_visit_date"
    t.integer  "home_visited_count",                           default: 0
    t.text     "double_confirmed"
    t.string   "lead_source"
    t.datetime "last_status_update"
    t.integer  "age"
    t.string   "gender"
    t.string   "medical_history"
    t.integer  "rescheduled_count",                            default: 0,     null: false
    t.datetime "latest_actual_visit_date"
    t.date     "expected_date"
    t.string   "chances_of_payment",               limit: 50
    t.string   "expected_amount",                  limit: 50
    t.string   "designation",                      limit: 50
    t.string   "company",                          limit: 50
    t.text     "profession"
    t.string   "income_level",                     limit: 50
    t.string   "quality_score",                    limit: 50
    t.integer  "inbound_interest"
    t.integer  "total_spoken_duration"
    t.text     "max_spoken_agent"
    t.date     "pending_task_date"
    t.text     "pending_task_owner"
    t.text     "pending_task_type"
    t.integer  "score"
    t.text     "hc_agent1"
    t.text     "hc_agent2"
    t.text     "hc_agent3"
    t.text     "referred_by"
    t.text     "preferred_time"
    t.text     "unassigned_reason"
    t.text     "last_met_hc"
    t.float    "poc"
    t.text     "preferred_app_time"
    t.text     "hc1_distance"
    t.text     "hc2_distance"
    t.text     "hc3_distance"
    t.text     "hc1_time"
    t.text     "hc2_time"
    t.text     "hc3_time"
    t.string   "tw_explained"
    t.text     "owner_alloted_by"
    t.date     "last_visit_date"
    t.integer  "status_update_delay"
    t.datetime "pts_feedback_time"
    t.text     "pts_reason_for_cancellation"
    t.text     "pts_hc_guilty"
    t.integer  "pts_penalty_amount"
    t.text     "pts_comments"
    t.text     "pts_visit_status"
    t.date     "pts_next_appd"
    t.time     "pts_next_time"
    t.boolean  "pts_client_not_picking"
    t.text     "pts_scheduler_email"
    t.text     "booked_by_id"
    t.datetime "last_pts_date"
    t.datetime "pts_not_picking_updated_on"
    t.integer  "pts_feedback_delay"
    t.text     "pts_not_picking_updated_by"
    t.text     "which_car"
    t.string   "callback_from_hc"
    t.date     "callback_date"
    t.text     "do_u_have_any_concern",                                                     array: true
    t.date     "enroll_date"
    t.string   "package_pitched"
    t.datetime "feedback_time"
    t.integer  "feedback_not_pickingup_count",                 default: 0
    t.integer  "pts_not_pickingup_count",                      default: 0
    t.datetime "mf_time"
    t.datetime "last_booking_date"
    t.text     "utm_campaign"
    t.text     "utm_medium"
    t.text     "promoter_name"
    t.datetime "followup_date"
    t.text     "followup_type"
    t.text     "reason_for_pass_to_schedulers"
    t.text     "which_doctor"
    t.string   "fat_percent",                      limit: 50
    t.string   "visceral_fat",                     limit: 50
    t.datetime "daf_form_updated_on"
    t.float    "bmr"
    t.text     "no_enrollment_reasons"
    t.text     "super_food_gift"
    t.string   "final_amount_offered",             limit: 20
    t.text     "secondary_package_pitched"
    t.string   "secondary_package_amount_offered", limit: 20
    t.text     "why_not_making_bill"
    t.integer  "slot_id"
    t.datetime "alternative_app_datetime"
    t.string   "waiting_list_status"
    t.text     "what_to_do_better"
    t.text     "make_client_more_interested"
    t.text     "write_why_late_meeting"
    t.text     "btl_campaign"
    t.text     "tc_comment"
    t.text     "tried_losing_weight"
    t.boolean  "altius_lead",                                  default: false
    t.boolean  "appointment_filled_from_form",                 default: false
    t.text     "dc_payment_status"
    t.text     "not_sold_questions"
    t.decimal  "bmi"
    t.text     "online_spoke"
    t.text     "online_interested"
    t.boolean  "hb_pitched"
    t.datetime "online_status_update_date"
    t.string   "online_status_updated_by"
    t.text     "offer_card_present"
    t.text     "decision_maker"
    t.text     "did_client_speak_to_manager"
    t.text     "online_status_comments"
    t.text     "hc_promo_code"
    t.text     "no_credit_card_questions"
    t.text     "intermediate_source"
    t.text     "state"
    t.text     "referred_by_employee_email"
    t.text     "referred_by_phone"
    t.text     "referred_by_name"
    t.text     "muscle_perc"
    t.text     "utm_content"
    t.text     "utm_source"
    t.index ["allotted_to"], name: "allotted_to_idx", using: :btree
    t.index ["appointment_type"], name: "appointment_type_idx", using: :btree
    t.index ["lead_id"], name: "lead_id_idx", using: :btree
    t.index ["phone"], name: "phone_idx", using: :btree
  end

  create_table "walkins", force: :cascade do |t|
    t.string   "lead_id",     limit: 40,  null: false
    t.string   "lead_name",   limit: 100
    t.integer  "agent_id",                null: false
    t.string   "emp_email",   limit: 50,  null: false
    t.integer  "centre_id",               null: false
    t.string   "phone",       limit: 20
    t.string   "email",       limit: 50
    t.string   "height",      limit: 10
    t.float    "weight"
    t.integer  "age"
    t.string   "disease",     limit: 20
    t.date     "walkin_date",             null: false
    t.string   "converted",   limit: 4,   null: false
    t.text     "comments"
    t.datetime "createdon",               null: false
    t.datetime "last_update",             null: false
  end

  create_table "webinar_datas", force: :cascade do |t|
    t.text     "phone"
    t.integer  "client_id"
    t.text     "lead_id"
    t.text     "language"
    t.text     "webinar_topic"
    t.text     "webinar_day"
    t.text     "webinar_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "webinar_challenge"
  end

  create_table "weight_proof", force: :cascade do |t|
    t.bigint   "client_id"
    t.text     "weight_proof_your_office"
    t.text     "weight_proof_your_grocery_shopping"
    t.text     "weight_proof_your_home"
    t.datetime "createdon",                          null: false
    t.datetime "last_update",                        null: false
    t.index ["client_id"], name: "weight_proof_client_id_key", unique: true, using: :btree
  end

  create_table "weight_tracker", id: :bigint, force: :cascade do |t|
    t.bigint   "client_id",        null: false
    t.float    "muscle"
    t.integer  "age"
    t.bigint   "comment_id"
    t.float    "weight"
    t.float    "hips"
    t.float    "waist"
    t.float    "fat"
    t.float    "weight_loss"
    t.datetime "measurement_date"
    t.bigint   "created_by_id"
    t.datetime "createdon",        null: false
    t.datetime "last_update",      null: false
    t.bigint   "dietician_id"
    t.boolean  "is_deleted"
    t.string   "weight_category"
    t.bigint   "deleted_by"
    t.text     "upload_proof_url"
    t.index ["client_id"], name: "ix_weight_tracker_client_25", using: :btree
  end

  create_table "weightloss_facts_quiz", force: :cascade do |t|
    t.bigint   "client_id"
    t.bigint   "quiz_questions_id"
    t.string   "answer",            limit: 255
    t.datetime "createdon"
    t.datetime "last_update"
    t.boolean  "is_correct"
  end

  create_table "why_client_not_loosing_weight", id: :bigint, force: :cascade do |t|
    t.text     "problem1"
    t.text     "problem2"
    t.text     "problem3"
    t.text     "problem4"
    t.text     "problem5"
    t.text     "suggestions1"
    t.text     "suggestions2"
    t.text     "suggestions3"
    t.text     "suggestions4"
    t.text     "suggestions5"
    t.text     "follow_program"
    t.text     "not_logging"
    t.text     "not_exercising"
    t.text     "logging_correctly"
    t.text     "health_benefits"
    t.text     "unhappy"
    t.text     "srcomments"
    t.bigint   "client_id"
    t.datetime "createdon",                        null: false
    t.datetime "last_update",                      null: false
    t.string   "filled_by",            limit: 255
    t.string   "comment_filled_by",    limit: 255
    t.text     "how_much_water"
    t.text     "how_much_sleep"
    t.text     "dinner_sleep_time"
    t.text     "stress_level"
    t.text     "does_eat_out"
    t.text     "how_much_oil"
    t.text     "have_cravings"
    t.text     "activity_level"
    t.text     "drugs"
    t.bigint   "filled_by_id"
    t.bigint   "comment_filled_by_id"
    t.datetime "srcomments_date"
    t.datetime "nlw_update_date"
    t.integer  "active_days"
  end

  create_table "woo_orders", force: :cascade do |t|
    t.text     "order_id"
    t.jsonb    "data"
    t.text     "status"
    t.integer  "bill_id",    array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "phone"
  end

  create_table "woo_product_items", force: :cascade do |t|
    t.integer  "woo_product_id"
    t.text     "item_id"
    t.decimal  "rate"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "update_at"
    t.datetime "updated_at"
  end

  create_table "woo_products", force: :cascade do |t|
    t.integer  "mrp"
    t.integer  "price"
    t.text     "name"
    t.text     "variant_id"
    t.boolean  "is_a_package"
    t.integer  "package_type_id"
    t.datetime "created_at"
    t.datetime "update_at"
    t.datetime "updated_at"
  end

  create_table "wow_experience", id: :bigserial, force: :cascade do |t|
    t.bigint   "client_id"
    t.date     "date",                                          null: false
    t.bigint   "centre_id"
    t.bigint   "dietician_id"
    t.string   "wow_experience",    limit: 32
    t.string   "reason",            limit: 256
    t.text     "message"
    t.boolean  "completed",                     default: false
    t.datetime "createdon",                                     null: false
    t.datetime "last_update",                                   null: false
    t.bigint   "movement_group_id"
  end

  create_table "wrong_referral_details", force: :cascade do |t|
    t.string   "lead_id",                              limit: 255
    t.integer  "client_feedback_id"
    t.integer  "feedback_submited_by_id"
    t.string   "feedback_referred_by",                 limit: 255
    t.string   "old_lead_source_bill",                 limit: 255
    t.string   "old_ls_main_intermediate_source_bill", limit: 255
    t.string   "old_lead_source_ls",                   limit: 255
    t.string   "old_ls_main_intermediate_source_ls",   limit: 255
    t.string   "referral_phone_number",                limit: 255
    t.string   "referred_by_phone_number",             limit: 255
    t.date     "referred_date"
    t.boolean  "created_from_form"
    t.string   "referred_by_employee_email",           limit: 255
    t.string   "referred_by_name",                     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "referred_by_email",                    limit: 255
    t.boolean  "is_dc_lead"
    t.integer  "bill_id"
    t.datetime "last_changed"
  end

  add_foreign_key "ach_plan", "package_type", name: "fk_ach_plan_package_type"
  add_foreign_key "activity", "core_user", column: "user_id", name: "fk_activity_ref_user_id"
  add_foreign_key "agent_approval_credit", "agents", name: "fk_agent_approval_credit"
  add_foreign_key "agent_ls_details", "agents", name: "fk_agent_ls_details_agent"
  add_foreign_key "agents", "agents", column: "manager_id", name: "agents_manager_id_fkey"
  add_foreign_key "agents", "agents", column: "team_leader_id", name: "agents_team_leader_id_fkey"
  add_foreign_key "agents", "serve_city", name: "agents_serve_city_id_fkey"
  add_foreign_key "alternate_schedule", "app_user", column: "applied_by_id", name: "fk_alternate_schedule_app_user_id"
  add_foreign_key "alternate_schedule", "app_user", name: "app_user_id_fkey"
  add_foreign_key "alternate_schedule", "dietician_center_info", name: "fk_alternate_schedule_dietician_center_info_16"
  add_foreign_key "android_reg", "app_user", name: "ck_android_reg_app_user_id_1"
  add_foreign_key "android_reg", "client", name: "ck_android_reg_client_id_1"
  add_foreign_key "answer", "client", name: "fk_answer_client_id"
  add_foreign_key "answer", "question", name: "fk_answer_question_id"
  add_foreign_key "app_file_tracker_logger", "client", name: "app_file_tracker_logger_client_id_fkey"
  add_foreign_key "app_user_reg", "app_user", name: "ck_app_user_reg_app_user_id_1"
  add_foreign_key "appointment", "app_user", column: "cancelled_by_id", name: "fk_appointment_cancelledby_2"
  add_foreign_key "appointment", "app_user", column: "created_by_id", name: "appointment_created_by_id_fkey"
  add_foreign_key "appointment", "app_user", column: "requested_by_id", name: "fk_appointment_requestedby_2"
  add_foreign_key "appointment", "appointment_feedback", column: "feedback_id", name: "pk_appointment_feedback_id_1"
  add_foreign_key "appointment", "appointment_type", name: "fk_appointment_appointmenttype_2"
  add_foreign_key "appointment", "dietician", column: "requested_to_id", name: "fk_appointment_requestedto_2"
  add_foreign_key "approvals", "agents", column: "given_by_agent_id", name: "fk_approvals_given_by_agent"
  add_foreign_key "approvals", "agents", column: "sales_agent_id", name: "fk_approvals_sales_agent"
  add_foreign_key "approvals", "approval_types", name: "fk_approvals_approval_type"
  add_foreign_key "assign_diet_plan_alt_data", "assign_diet_plans", column: "assign_diet_plans_id", name: "assign_diet_plan_alt_data_assign_diet_plan_id_fkey_16"
  add_foreign_key "assign_diet_plan_alt_data", "food", name: "assign_diet_plan_alt_data_first_food_id_fkey"
  add_foreign_key "assign_diet_plan_data", "assign_diet_plans", column: "assign_diet_plans_id", name: "assign_diet_plan_data_id_fkey"
  add_foreign_key "assign_diet_plan_data", "food", name: "assign_diet_plan_data_food_id_fkey1"
  add_foreign_key "assign_diet_plan_data", "meal_time", name: "assign_diet_plan_data_meal_time_id_fkey"
  add_foreign_key "assign_diet_plans", "assign_dietcharts", column: "assign_dietcharts_id", name: "assign_dietcharts_id_fkey"
  add_foreign_key "bills", "agents"
  add_foreign_key "bills", "client_occupation", name: "fk_bills_client_occupation"
  add_foreign_key "bills", "inventory_nodes", column: "detox_kit_inv_node", name: "fk_bills_detoxkit_inventory_node"
  add_foreign_key "card_label", "label", name: "fk_card_label_ref_label_id"
  add_foreign_key "card_label", "report_card", column: "card_id", name: "fk_card_label_ref_card_id"
  add_foreign_key "center_coordinator", "app_user", name: "fk_manager_app_user_01"
  add_foreign_key "center_coordinator", "centre", name: "fk_center_coordinator_centre_16"
  add_foreign_key "center_coordinator", "centre", name: "fk_centreid_6"
  add_foreign_key "center_targets", "agents", column: "target_set_by", name: "fk_center_targets_target_set_by"
  add_foreign_key "center_targets", "centre", column: "center_id", name: "fk_center_targets_center"
  add_foreign_key "centre", "address", name: "fk_centre_address_1"
  add_foreign_key "centre", "inventory_nodes", name: "fk_centre_inventory_node"
  add_foreign_key "channel_cost_spent_details", "agents", column: "added_by_agent_id", name: "fk_channel_cost_spent_details_added_by_agent"
  add_foreign_key "chat", "app_user", column: "commented_by_id", name: "fk_chat_commentedby_8"
  add_foreign_key "chat", "app_user", column: "commented_to_id", name: "fk_chat_commentedto_8"
  add_foreign_key "chat_messages", "visits", name: "chat_messages_visit_id_fkey"
  add_foreign_key "chat_notification", "app_user", column: "sent_by_id", name: "chat_notification_sent_by_id_fk"
  add_foreign_key "chat_notification", "chat", name: "fk_chat_notification_chat_id_1"
  add_foreign_key "chat_notification", "client", name: "fk_chat_notification_client_id_1"
  add_foreign_key "chat_notification", "dietician", name: "fk_chat_notification_dietician_id_1"
  add_foreign_key "client", "app_user", column: "courier_status_updated_by_id", name: "fk_courier_status_updated_by_id_8"
  add_foreign_key "client", "app_user", column: "courier_updated_by_id", name: "fk_courier_updated_by_id_8"
  add_foreign_key "client", "app_user", column: "interest_updated_by_id", name: "fk_interest_updated_by_id_8"
  add_foreign_key "client", "app_user", name: "fk_client_appuser_3"
  add_foreign_key "client", "bills", column: "current_primary_bill_id", name: "fk_current_primary_bills_client"
  add_foreign_key "client", "centre", column: "source_centre_id", name: "fk_client_source_centre_id"
  add_foreign_key "client", "client_doctor_info", column: "doctor_info_id", name: "fk_client_doctorinfo_4"
  add_foreign_key "client", "client_medical_history", column: "medical_history_id", name: "fk_client_medicalhistory_4"
  add_foreign_key "client", "client_motivation", name: "fk_client_motivation"
  add_foreign_key "client", "client_occupation", name: "fk_client_clientoccupation_2"
  add_foreign_key "client", "client_weight_history", column: "weight_history_id", name: "fk_client_weighthistory_5"
  add_foreign_key "client", "diet_recall", name: "ck_client_diet_recall_id_1"
  add_foreign_key "client", "dietician", column: "primary_dietician_id", name: "primary_dietician_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "client", "food_drink_info", name: "fk_client_fooddrinkinfo_6"
  add_foreign_key "client_additional_data", "app_user", column: "chance_of_upgrade_entered_by", name: "client_additional_data_chance_of_upgrade_entered_by_fkey"
  add_foreign_key "client_centre", "centre", name: "fk_client_centre_centre_02"
  add_foreign_key "client_centre", "client", name: "fk_client_centre_client_01"
  add_foreign_key "client_charity_count", "client", name: "fk_client_charity_count_client_id_1"
  add_foreign_key "client_daily_activities", "client", name: "client_daily_activities_client_id_fkey"
  add_foreign_key "client_dietician", "client", name: "fk_client_dietician_client_01"
  add_foreign_key "client_dietician", "dietician", name: "fk_client_dietician_dietician_02"
  add_foreign_key "client_dietician_allotment_detail", "client", name: "fk_client_dietician_allotment_detail_client_01"
  add_foreign_key "client_dietician_allotment_detail", "dietician", name: "fk_client_dietician_allotment_detail_dietician_02"
  add_foreign_key "client_exercise_tracker_logger", "client", name: "client_exercise_tracker_logger_client_id_fkey"
  add_foreign_key "client_feedback", "app_user", column: "action_comment_changed_by_id", name: "fk_action_comment_changed_by_id_8"
  add_foreign_key "client_feedback", "app_user", column: "compl_catagory_submited_by_id", name: "client_feedback_compl_catagory_submited_by_id_fkey"
  add_foreign_key "client_feedback", "app_user", column: "complaint_submited_by_id", name: "client_feedback_complaint_submited_by_id_fkey"
  add_foreign_key "client_feedback", "app_user", column: "handled_updated_by_id", name: "client_feedback_handled_updated_by_id_fkey"
  add_foreign_key "client_feedback", "app_user", column: "request_category_submitted_by_id", name: "client_feedback_request_category_submitted_by_id_fkey"
  add_foreign_key "client_feedback", "app_user", column: "resolve_submited_by_id", name: "client_feedback_resolve_submited_by_id_fkey"
  add_foreign_key "client_feedback", "app_user", column: "submited_by_id", name: "fk_client_feedback_submited_by_id_01"
  add_foreign_key "client_feedback", "client", name: "fk_client_feedback_client_01"
  add_foreign_key "client_feedback", "fav_super_food", name: "fk_client_feedback_fav_super_food_01"
  add_foreign_key "client_feedback_super_food", "client_feedback", name: "client_feedback_super_food_client_feedback_id_fkey"
  add_foreign_key "client_feedback_super_food", "super_food", name: "client_feedback_super_food_super_food_id_fkey"
  add_foreign_key "client_medical_history_allergies", "allergies", column: "allergies_id", name: "fk_client_medical_history_all_02"
  add_foreign_key "client_medical_history_allergies", "client_medical_history", name: "fk_client_medical_history_all_01"
  add_foreign_key "client_medical_history_condition", "client_medical_history", name: "fk_client_medical_history_con_01"
  add_foreign_key "client_medical_history_condition", "condition", name: "fk_client_medical_history_con_02"
  add_foreign_key "client_medical_history_disease", "client_medical_history", name: "fk_client_medical_history_dis_01"
  add_foreign_key "client_medical_history_disease", "disease", name: "fk_client_medical_history_dis_02"
  add_foreign_key "client_medical_info", "app_user", column: "uploaded_by_id", name: "fk_med_info_uploaded_by_1"
  add_foreign_key "client_medical_info", "client", name: "fk_med_info_client_1"
  add_foreign_key "client_medical_info", "file_entity", name: "fk_client_medical_info_file_entity_01"
  add_foreign_key "client_medical_info_extra_parame", "client_medical_info", name: "client_medical_info_extra_parame_client_medical_info_id_fkey"
  add_foreign_key "client_medical_info_extra_parame", "extra_parameter", name: "client_medical_info_extra_parame_extra_parameter_id_fkey"
  add_foreign_key "client_month_kit_movement", "client", name: "fk_client_month_kit_movement_client"
  add_foreign_key "client_month_kit_movement", "month_kit", name: "fk_client_month_kit_movement_month_kit"
  add_foreign_key "client_monthly_review", "app_user", column: "created_by_id", name: "fk_client_monthly_review_2"
  add_foreign_key "client_monthly_review", "app_user", column: "updated_by_id", name: "fk_client_monthly_review_3"
  add_foreign_key "client_monthly_review", "client", name: "fk_client_monthly_review"
  add_foreign_key "client_monthly_review_comment", "comment", name: "fk_client_monthly_review_comment_id_1"
  add_foreign_key "client_motivation_hindrances", "client_motivation", name: "fk_client_motivation_hindrances_02"
  add_foreign_key "client_motivation_hindrances", "hindrances", column: "hindrances_id", name: "fk_client_motivation_hindrances_01"
  add_foreign_key "client_not_loosing_weight", "app_user", column: "created_by_id", name: "fk_client_not_loosing_weight_2"
  add_foreign_key "client_not_loosing_weight", "app_user", column: "updated_by_id", name: "fk_client_not_loosing_weight_3"
  add_foreign_key "client_not_loosing_weight", "client", name: "fk_client_not_loosing_weight_client_id_1"
  add_foreign_key "client_not_loosing_weight_comment", "comment", name: "fk_client_not_loosing_weight_comment_id_1"
  add_foreign_key "client_pref_pref_category", "client_preference", name: "fk_client_pref_pref_category_client_preference_id_01"
  add_foreign_key "client_pref_pref_category", "preference_category", name: "fk_client_pref_pref_category_preference_category_id_01"
  add_foreign_key "client_preference", "client", name: "client_preference_client_id_fkey"
  add_foreign_key "client_preference_food", "client_preference", name: "fk_client_client_preference_id_01"
  add_foreign_key "client_preference_food", "food", name: "fk_client_preference_food_food_id_01"
  add_foreign_key "client_score", "client", name: "fk_client_score_client_01"
  add_foreign_key "client_suggestion", "client", name: "fk_client_suggestion_client_id_1"
  add_foreign_key "client_survey_history", "client", name: "fk_client_survey_history_client"
  add_foreign_key "client_survey_history", "client_activities_done_info", name: "fk_client_survey_history_activities_done"
  add_foreign_key "client_transferred_history", "dietician", column: "new_dietician_id", name: "client_transferred_history_new_dietician_id_fkey"
  add_foreign_key "client_transferred_history", "dietician", column: "old_dietician_id", name: "client_transferred_history_old_dietician_id_fkey"
  add_foreign_key "client_weight_history", "female_info", name: "fk_client_weight_history_femal_7"
  add_foreign_key "collection", "core_user", column: "personal_owner_id", name: "fk_collection_personal_owner_id"
  add_foreign_key "collection_revision", "core_user", column: "user_id", name: "fk_collection_revision_user_id"
  add_foreign_key "comment", "app_user", column: "commented_to_id", name: "fk_comment_commentedto_9"
  add_foreign_key "comment", "app_user", column: "commited_by_id", name: "fk_comment_commitedby_8"
  add_foreign_key "comment_comment_tag", "comment", name: "fk_comment_comment_tag_01"
  add_foreign_key "comment_comment_tag", "comment_tag", name: "fk_comment_comment_tag_02"
  add_foreign_key "community_community_group", "community", primary_key: "client_id", name: "fk_community_client_group1"
  add_foreign_key "community_community_group", "community_group", primary_key: "applozic_group_id", name: "fk_community_client_group2"
  add_foreign_key "complaint", "app_user", column: "complaint_by_id", name: "fk_complaint_complaintby_8"
  add_foreign_key "complaint", "app_user", column: "complaint_to_id", name: "fk_complaint_complaintto_8"
  add_foreign_key "computation_job", "core_user", column: "creator_id", name: "fk_computation_job_ref_user_id"
  add_foreign_key "computation_job_result", "computation_job", column: "job_id", name: "fk_computation_result_ref_job_id"
  add_foreign_key "core_session", "core_user", column: "user_id", name: "fk_session_ref_user_id"
  add_foreign_key "counselor", "app_user", name: "fk_counselor_app_user_01"
  add_foreign_key "counselor", "centre", name: "fk_centreid_6"
  add_foreign_key "counselor", "centre", name: "fk_counselor_centre_16"
  add_foreign_key "counselor_incentive", "employee", name: "fk_counselor_incentive_emp"
  add_foreign_key "counselor_targets", "agents", column: "target_set_by", name: "fk_counselor_targets_target_set_by"
  add_foreign_key "counselor_targets", "employee", name: "fk_counselor_targets_center"
  add_foreign_key "coupons", "bills", name: "coupons_bill_id_fkey"
  add_foreign_key "coupons", "client", name: "coupons_client_id_fkey"
  add_foreign_key "coupons", "coupon_criteria", column: "coupon_criteria_id", name: "coupons_coupon_criteria_id_fkey"
  add_foreign_key "coupons", "generated_shopify_discount_codes", column: "gsdc_id", name: "fk_coupons_gscd_id"
  add_foreign_key "cron_job_status", "master_cron_job", name: "master_cron_job_id_fkey"
  add_foreign_key "dashboard_favorite", "core_user", column: "user_id", name: "fk_dashboard_favorite_user_id", on_delete: :cascade
  add_foreign_key "dashboard_favorite", "report_dashboard", column: "dashboard_id", name: "fk_dashboard_favorite_dashboard_id", on_delete: :cascade
  add_foreign_key "dashboardcard_series", "report_card", column: "card_id", name: "fk_dashboardcard_series_ref_card_id"
  add_foreign_key "dashboardcard_series", "report_dashboardcard", column: "dashboardcard_id", name: "fk_dashboardcard_series_ref_dashboardcard_id"
  add_foreign_key "day_schedule", "app_user", name: "app_user_id_fkey"
  add_foreign_key "day_schedule", "dietician_center_info", name: "fk_day_schedule_dietician_center_info_16"
  add_foreign_key "diet_chart", "diet_plan", name: "fk_diet_chart_dietplan_8"
  add_foreign_key "diet_food_log", "assign_diet_plans", column: "assign_diet_plans_id", name: "fk_diet_food_log_assign_diet_plans_id_1"
  add_foreign_key "diet_food_log", "assign_dietcharts", column: "assign_dietcharts_id", name: "fk_diet_food_log_assign_dietcharts_id_1"
  add_foreign_key "diet_food_log", "meal_time", name: "fk_diet_food_log_meal_time_id_1"
  add_foreign_key "diet_log", "app_user", column: "uploaded_by_id", name: "fk_dietlog_uploaded_by"
  add_foreign_key "diet_log", "chat", name: "fk_diet_log_chat_id_10"
  add_foreign_key "diet_log_report", "client", name: "fk_client_10"
  add_foreign_key "diet_log_report", "dietician", name: "fk_dietician_10"
  add_foreign_key "diet_plan", "app_user", column: "prescribed_by_id", name: "fk_diet_plan_prescribedby_10"
  add_foreign_key "diet_plan", "client", name: "fk_diet_plan_client_9"
  add_foreign_key "diet_plan", "comment", column: "diet_comment_id", name: "fk_diet_plan_dietcomment_11"
  add_foreign_key "diet_plan", "diet_phase", name: "fk_diet_plan_dietphase_12"
  add_foreign_key "diet_score_answer", "app_user", column: "scored_by", name: "diet_score_answer_scored_by_fkey"
  add_foreign_key "diet_score_answer", "client", name: "diet_score_answer_client_id_fkey"
  add_foreign_key "dietician", "app_user", column: "crm_id", name: "fk_dietician_appuser_16"
  add_foreign_key "dietician", "app_user", name: "fk_dietician_appuser_13"
  add_foreign_key "dietician", "dietician", column: "ayurveda_id", name: "fk_dietician_appuser_17"
  add_foreign_key "dietician", "dietician", column: "buddy_dietician_id", name: "fk_dietician_dietician_14"
  add_foreign_key "dietician", "dietician", column: "sr_dietician_id", name: "fk_dietician_dietician_15"
  add_foreign_key "dietician_center_info", "centre", column: "center_id", name: "fk_dietician_center_info_cent_15"
  add_foreign_key "dietician_center_info", "dietician", name: "fk_dietician_center_info_diet_14"
  add_foreign_key "dimension", "metabase_field", column: "field_id", name: "fk_dimension_ref_field_id", on_delete: :cascade
  add_foreign_key "dimension", "metabase_field", column: "human_readable_field_id", name: "fk_dimension_displayfk_ref_field_id", on_delete: :cascade
  add_foreign_key "dp_recording", "home_visit_presentation", name: "fk_dp_recording"
  add_foreign_key "exercise_video_exercise_category", "exercise_category", name: "exercise_video_exercise_category_exercise_category_id_fkey"
  add_foreign_key "exercise_video_exercise_category", "exercise_category", name: "fk_exercise_category"
  add_foreign_key "exercise_video_exercise_category", "exercise_video", name: "exercise_video_exercise_category_exercise_video_id_fkey"
  add_foreign_key "exercise_video_exercise_category", "exercise_video", name: "fk_exercise_video"
  add_foreign_key "fav_super_food_super_food", "fav_super_food", name: "fav_super_food_super_food_fav_super_food_id_fkey"
  add_foreign_key "fav_super_food_super_food", "super_food", name: "fav_super_food_super_food_super_food_id_fkey"
  add_foreign_key "food", "app_user", column: "created_by_id", name: "food_app_user_id_fkey"
  add_foreign_key "food_disease", "disease", name: "fk_food_disease_disease_id_01"
  add_foreign_key "food_disease", "food", name: "fk_food_disease_food_id_01"
  add_foreign_key "food_name_audit", "app_user", column: "changed_by_id", name: "food_name_audit_changed_by_id_fkey"
  add_foreign_key "food_name_audit", "food", name: "food_name_audit_food_id_fkey"
  add_foreign_key "food_qty_unit", "food", name: "fk_food_qty_unit_food"
  add_foreign_key "food_rating", "app_user", column: "created_by_id", name: "fk_food_rating_created_by_id_1"
  add_foreign_key "food_rating", "client", name: "fk_food_rating_client_id_1"
  add_foreign_key "food_rating", "food", name: "fk_food_rating_food_id_1"
  add_foreign_key "food_substitutes", "food", column: "substitute_food_id", name: "fk_food_substitutes_substitute_food_16"
  add_foreign_key "food_substitutes", "food", name: "fk_food_substitutes_food_16"
  add_foreign_key "frozen", "agents", column: "frozen_by_agent_id", name: "fk_frozen_frozen_by_agent_id"
  add_foreign_key "frozen", "app_user", column: "frozen_by_id", name: "fk_frozen_appuser_id"
  add_foreign_key "frozen", "bills", name: "fk_frozen_bill_id"
  add_foreign_key "frozen", "client", name: "fk_frozen_client_id"
  add_foreign_key "frozen", "package", name: "fk_frozen_package_id"
  add_foreign_key "handle_client_complaint", "app_user", column: "complaint_handle_by_id", name: "handle_client_complaint_complaint_handled_by_id_fkey"
  add_foreign_key "handle_client_complaint", "client_feedback", name: "handle_client_complaint_client_feedback_id_fkey"
  add_foreign_key "health_box_gift", "client", name: "health_box_gift_client_id_fkey"
  add_foreign_key "health_dollar", "client", name: "health_dollar_client"
  add_foreign_key "home_visits", "agents", name: "home_visits_agent_id_fkey"
  add_foreign_key "home_visits", "visits", name: "home_visits_visit_id_fkey"
  add_foreign_key "ingredient", "food", column: "ingredient_food_id", name: "fk_ingredient_food_ingredient_food_id"
  add_foreign_key "ingredient", "food", name: "ck_ingredient_food_id"
  add_foreign_key "inventory_movements", "agents", column: "receiver_agent_id", name: "fk_inventory_movement_agent2"
  add_foreign_key "inventory_movements", "agents", column: "sender_agent_id", name: "fk_inventory_movement_agent1"
  add_foreign_key "inventory_movements", "items", name: "fk_inventory_movement_item"
  add_foreign_key "inventory_node_items", "inventory_nodes", name: "fk_inventory_node_items_inventory_node_02"
  add_foreign_key "inventory_node_items", "items", name: "fk_inventory_node_items_item_01"
  add_foreign_key "inventory_pantry", "inventory_nodes", name: "fk_inventory_pantry_inventory_node_02"
  add_foreign_key "invoice", "app_user", column: "created_by_id", name: "fk_invoice_createdby_18"
  add_foreign_key "invoice", "app_user", column: "sold_by_id", name: "fk_invoice_soldby_21"
  add_foreign_key "invoice", "app_user", column: "verified_by_id", name: "fk_invoice_verifiedby_19"
  add_foreign_key "invoice", "centre", name: "fk_invoice_centre_17"
  add_foreign_key "invoice", "client", name: "fk_invoice_client_16"
  add_foreign_key "invoice", "package", column: "product_package_id", name: "fk_invoice_productpackage_20"
  add_foreign_key "item_food", "food", name: "fk_item_food_food"
  add_foreign_key "item_food", "items", name: "fk_item_food_item"
  add_foreign_key "item_sales", "bills"
  add_foreign_key "item_sales", "items"
  add_foreign_key "master_diet_plan", "app_user", column: "updated_by_id", name: "fk_master_diet_plan_10"
  add_foreign_key "master_diet_plan", "diet_phase", name: "master_diet_plan_diet_phase_id_fkey"
  add_foreign_key "master_diet_plan_alt_data", "food", name: "master_diet_plan_alt_data_first_food_id_fkey"
  add_foreign_key "master_diet_plan_alt_data", "master_diet_plan", name: "master_diet_plan_alt_data_master_diet_plan_id_fkey"
  add_foreign_key "master_diet_plan_data", "food", name: "master_diet_plan_data_food_id_fkey1"
  add_foreign_key "master_diet_plan_data", "master_diet_plan", name: "master_diet_plan_data_master_diet_plan_id_fkey"
  add_foreign_key "master_diet_plan_data", "meal_time", name: "master_diet_plan_data_meal_time_id_fkey"
  add_foreign_key "medication", "client_medical_history", name: "fk_medication_client_medical__22"
  add_foreign_key "metabase_field", "metabase_field", column: "parent_id", name: "fk_field_parent_ref_field_id"
  add_foreign_key "metabase_field", "metabase_table", column: "table_id", name: "fk_field_ref_table_id"
  add_foreign_key "metabase_fieldvalues", "metabase_field", column: "field_id", name: "fk_fieldvalues_ref_field_id"
  add_foreign_key "metabase_table", "metabase_database", column: "db_id", name: "fk_table_ref_database_id"
  add_foreign_key "metric", "core_user", column: "creator_id", name: "fk_metric_ref_creator_id"
  add_foreign_key "metric", "metabase_table", column: "table_id", name: "fk_metric_ref_table_id"
  add_foreign_key "metric_important_field", "metabase_field", column: "field_id", name: "fk_metric_important_field_metabase_field_id"
  add_foreign_key "metric_important_field", "metric", name: "fk_metric_important_field_metric_id"
  add_foreign_key "month_kit", "disease", column: "disease_condition", name: "fk_month_kit_disease_condition"
  add_foreign_key "month_kit_item", "items", name: "fk_month_kit_item_item"
  add_foreign_key "month_kit_item", "month_kit", name: "fk_month_kit_item_month_kit"
  add_foreign_key "monthly_stock_reports", "inventory_nodes", name: "fk_monthly_stock_reports_inventory_node"
  add_foreign_key "not_available_hc_slots", "agents", name: "fk_notavailable_hc_slots_agent"
  add_foreign_key "not_available_hc_slots", "visit_slots", column: "slot_id", name: "fk_notavailable_hc_slots_slot"
  add_foreign_key "notification", "app_user", column: "notification_from_id", name: "fk_notification_notificationfrom_1"
  add_foreign_key "notification", "app_user", column: "notification_to_id", name: "fk_notification_notificationto_1"
  add_foreign_key "notification", "client", name: "fk_notification_client_1"
  add_foreign_key "nq_visits", "visits", name: "nq_visits_visit_id_fkey"
  add_foreign_key "nutrition_manager_report", "nutrition_manager_team", name: "fk_nutrition_manager_report_nutrition_manager_team_1"
  add_foreign_key "package", "app_user", column: "reason_change_by_id", name: "fk_package_reasonchangeby_1"
  add_foreign_key "package", "app_user", column: "status_change_by_id", name: "fk_package_statuschangeby_1"
  add_foreign_key "package", "package_type", name: "fk_package_packagetype_23"
  add_foreign_key "package_items", "items", name: "fk_package_items_item_01"
  add_foreign_key "package_items", "package_type", name: "fk_package_items_package_type_02"
  add_foreign_key "package_upgrade_recommendations", "package_type", column: "upgradable_package_type_id", name: "fk_package_upgrade_recommendation_upgradable_package"
  add_foreign_key "package_upgrade_recommendations", "package_type", name: "fk_package_upgrade_recommendation_from_package"
  add_foreign_key "payment_details", "payments", name: "fk_payment_details_payment"
  add_foreign_key "payments", "bills"
  add_foreign_key "payments", "employee", column: "employee1", name: "fk_payments_employee1"
  add_foreign_key "penalties", "agents", column: "given_by_id", name: "penalties_given_by_id_fkey"
  add_foreign_key "penalties", "agents", name: "penalties_agent_id_fkey"
  add_foreign_key "penalties", "client", name: "penalties_client_id_fkey"
  add_foreign_key "penalties", "penalty_types", name: "penalties_penalty_type_id_fkey"
  add_foreign_key "penalties", "visits", name: "penalties_visit_id_fkey"
  add_foreign_key "permissions", "permissions_group", column: "group_id", name: "fk_permissions_group_id"
  add_foreign_key "permissions_group_membership", "core_user", column: "user_id", name: "fk_permissions_group_membership_user_id"
  add_foreign_key "permissions_group_membership", "permissions_group", column: "group_id", name: "fk_permissions_group_group_id"
  add_foreign_key "permissions_revision", "core_user", column: "user_id", name: "fk_permissions_revision_user_id"
  add_foreign_key "plan_designed_for_disease", "disease", name: "fk_plan_designed_for_disease_disease_id_01"
  add_foreign_key "plan_designed_for_disease", "master_diet_plan", name: "fk_plan_designed_for_disease_master_diet_plan_id_01"
  add_foreign_key "plan_not_recommended_for_disease", "disease", name: "fk_plan_not_recommended_for_disease_disease_id_01"
  add_foreign_key "plan_not_recommended_for_disease", "master_diet_plan", name: "fk_plan_not_recommended_for_disease_master_diet_plan_id_01"
  add_foreign_key "point", "client", name: "fk_point_client_01"
  add_foreign_key "point", "dietician", name: "fk_dietician_point_25"
  add_foreign_key "point", "point_config", column: "config_name_id", name: "fk_config_name_10"
  add_foreign_key "preference_category", "food", name: "fk_preference_category_food_id_1"
  add_foreign_key "program_details", "package_type", name: "fk_program_details_package_type"
  add_foreign_key "pulse", "collection", name: "fk_pulse_collection_id"
  add_foreign_key "pulse", "core_user", column: "creator_id", name: "fk_pulse_ref_creator_id"
  add_foreign_key "pulse_card", "pulse", name: "fk_pulse_card_ref_pulse_id"
  add_foreign_key "pulse_card", "report_card", column: "card_id", name: "fk_pulse_card_ref_card_id"
  add_foreign_key "pulse_channel", "pulse", name: "fk_pulse_channel_ref_pulse_id"
  add_foreign_key "pulse_channel_recipient", "core_user", column: "user_id", name: "fk_pulse_channel_recipient_ref_user_id"
  add_foreign_key "pulse_channel_recipient", "pulse_channel", name: "fk_pulse_channel_recipient_ref_pulse_channel_id"
  add_foreign_key "qrtz_blob_triggers", "qrtz_triggers", column: "sched_name", primary_key: "sched_name", name: "fk_qrtz_blob_triggers_triggers"
  add_foreign_key "qrtz_cron_triggers", "qrtz_triggers", column: "sched_name", primary_key: "sched_name", name: "fk_qrtz_cron_triggers_triggers"
  add_foreign_key "qrtz_simple_triggers", "qrtz_triggers", column: "sched_name", primary_key: "sched_name", name: "fk_qrtz_simple_triggers_triggers"
  add_foreign_key "qrtz_simprop_triggers", "qrtz_triggers", column: "sched_name", primary_key: "sched_name", name: "fk_qrtz_simprop_triggers_triggers"
  add_foreign_key "qrtz_triggers", "qrtz_job_details", column: "sched_name", primary_key: "sched_name", name: "fk_qrtz_triggers_job_details"
  add_foreign_key "query_queryexecution", "core_user", column: "executor_id", name: "fk_queryexecution_ref_user_id"
  add_foreign_key "reply_comment", "app_user", column: "commented_by_id", name: "fk_reply_comment_commentedby_8"
  add_foreign_key "reply_comment", "app_user", column: "commented_to_id", name: "fk_reply_comment_commentedto_8"
  add_foreign_key "reply_comment", "comment", name: "fk_comment_1"
  add_foreign_key "report_card", "collection", name: "fk_card_collection_id"
  add_foreign_key "report_card", "core_user", column: "creator_id", name: "fk_card_ref_user_id"
  add_foreign_key "report_card", "core_user", column: "made_public_by_id", name: "fk_card_made_public_by_id"
  add_foreign_key "report_card", "metabase_database", column: "database_id", name: "fk_report_card_ref_database_id"
  add_foreign_key "report_card", "metabase_table", column: "table_id", name: "fk_report_card_ref_table_id"
  add_foreign_key "report_cardfavorite", "core_user", column: "owner_id", name: "fk_cardfavorite_ref_user_id"
  add_foreign_key "report_cardfavorite", "report_card", column: "card_id", name: "fk_cardfavorite_ref_card_id"
  add_foreign_key "report_dashboard", "collection", name: "fk_dashboard_collection_id"
  add_foreign_key "report_dashboard", "core_user", column: "creator_id", name: "fk_dashboard_ref_user_id"
  add_foreign_key "report_dashboard", "core_user", column: "made_public_by_id", name: "fk_dashboard_made_public_by_id"
  add_foreign_key "report_dashboardcard", "report_card", column: "card_id", name: "fk_dashboardcard_ref_card_id"
  add_foreign_key "report_dashboardcard", "report_dashboard", column: "dashboard_id", name: "fk_dashboardcard_ref_dashboard_id"
  add_foreign_key "revision", "core_user", column: "user_id", name: "fk_revision_ref_user_id"
  add_foreign_key "segment", "core_user", column: "creator_id", name: "fk_segment_ref_creator_id"
  add_foreign_key "segment", "metabase_table", column: "table_id", name: "fk_segment_ref_table_id"
  add_foreign_key "serve_city", "agents", column: "team_lead_id", name: "serve_city_team_lead_id_fkey"
  add_foreign_key "sf_movement_history", "sf_movement_details", column: "sf_movement_group_id", primary_key: "movement_group_id", name: "fk_sf_movement_history_sf_movement"
  add_foreign_key "shipping_address", "app_user", column: "updated_by_id", name: "fk_appuser"
  add_foreign_key "shipping_address", "client", name: "shipping_address_client_id_fkey"
  add_foreign_key "shopify_bundle_items", "items", name: "fk_shopify_bundle_items_item"
  add_foreign_key "shopify_bundle_items", "shopify_bundles", name: "fk_shopify_bundle_items_shopify_bundle"
  add_foreign_key "stock_audits", "agents", column: "filled_by", name: "fk_stock_audit_agent_filled_by"
  add_foreign_key "stock_audits", "inventory_nodes", name: "fk_stock_audit_inventory_node"
  add_foreign_key "stock_audits", "items", name: "fk_stock_audit_item"
  add_foreign_key "super_food_kit_due", "bills", name: "fk_super_food_kit_due_bills_2"
  add_foreign_key "super_food_kit_due", "client", name: "fk_super_food_kit_due_client_3"
  add_foreign_key "supplement", "client", name: "fk_supplement_client_1"
  add_foreign_key "supplement", "dietician", column: "assigned_by_id", name: "fk_supplement_assignedby_1"
  add_foreign_key "survey_monkey_details", "client_activities", column: "activity_id", name: "fk_survey_monkey_details_activity"
  add_foreign_key "tc_incentives", "agents", column: "given_by_id", name: "fk_tc_incentives_given_by"
  add_foreign_key "tc_incentives", "agents", name: "fk_tc_incentives_agent"
  add_foreign_key "tc_incentives", "client", name: "fk_tc_incentives_client"
  add_foreign_key "tc_incentives", "incentive_types", name: "fk_tc_incentives_incentive_type"
  add_foreign_key "tc_incentives", "visits", name: "fk_tc_incentives_visit"
  add_foreign_key "team", "agents", column: "tl_id", name: "fk_tl_id"
  add_foreign_key "team_center", "centre", column: "center_id", name: "fk_team_center_center"
  add_foreign_key "team_center", "team", name: "fk_team_center_team"
  add_foreign_key "team_targets", "agents", column: "target_set_by", name: "fk_counselor_targets_target_set_by"
  add_foreign_key "team_targets", "team", name: "fk_team_targets_team"
  add_foreign_key "telecaller", "app_user", name: "fk_telecaller_app_user_01"
  add_foreign_key "tutorial_video_recordings", "agents", name: "tutorial_video_recordings_agent_id_fkey"
  add_foreign_key "tutorial_video_recordings", "tutorial_videos", name: "tutorial_video_recordings_tutorial_video_id_fkey"
  add_foreign_key "tutorial_video_statuses", "agents", name: "tutorial_video_statuses_agent_id_fkey"
  add_foreign_key "tutorial_video_statuses", "tutorial_videos", name: "tutorial_video_statuses_tutorial_video_id_fkey"
  add_foreign_key "tutorial_videos", "tutorial_video_categories", name: "tutorial_videos_tutorial_video_category_id_fkey"
  add_foreign_key "user_activity", "app_user", column: "user_id", name: "ck_user_activity_app_user_id_1"
  add_foreign_key "video_watch_logs", "client", name: "video_watch_logs_client_id_fkey"
  add_foreign_key "video_watch_logs", "videos", name: "video_watch_logs_video_id_fkey"
  add_foreign_key "video_watch_logs_backup", "client", name: "video_watch_logs_backup_client_id_fkey"
  add_foreign_key "video_watch_logs_backup", "videos", name: "video_watch_logs_backup_video_id_fkey"
  add_foreign_key "view_log", "core_user", column: "user_id", name: "fk_view_log_ref_user_id"
  add_foreign_key "visit_doctor_form", "agents", column: "spoken_by_id", name: "fk_visit_doctor_form_spoken_by"
  add_foreign_key "visit_doctor_form", "visits", name: "fk_visit_doctor_form_visit"
  add_foreign_key "visits", "agents", column: "feedback_by_id", name: "visits_feedback_by_id_fkey"
  add_foreign_key "visits", "visit_slots", column: "slot_id", name: "fk_visits_slot"
  add_foreign_key "weight_tracker", "app_user", column: "created_by_id", name: "fk_weight_tracker_createdby_27"
  add_foreign_key "weight_tracker", "client", name: "fk_weight_tracker_client_25"
  add_foreign_key "weight_tracker", "comment", name: "fk_weight_tracker_comment_26"
  add_foreign_key "wow_experience", "sf_movement_details", column: "movement_group_id", primary_key: "movement_group_id", name: "fk_movement_group_id"
  add_foreign_key "wrong_referral_details", "app_user", column: "feedback_submited_by_id", name: "wrong_referral_details_feedback_submited_by_id_fkey"
  add_foreign_key "wrong_referral_details", "bills", name: "wrong_referral_details_bill_id_fkey"
  add_foreign_key "wrong_referral_details", "client_feedback", name: "wrong_referral_details_client_feedback_id_fkey"
end
