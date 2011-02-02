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

ActiveRecord::Schema.define(:version => 20110126113319) do

  create_table "components", :id => false, :force => true do |t|
    t.string   "uuid",                :limit => 36,       :null => false
    t.string   "version",             :limit => 20,       :null => false
    t.string   "label",                                   :null => false
    t.string   "title",                                   :null => false
    t.integer  "taverna_activity_id",                     :null => false
    t.integer  "submitter_id",                            :null => false
    t.string   "submitter_type",                          :null => false
    t.text     "description",         :limit => 16777215
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["uuid"], :name => "index_components_on_uuid"

  create_table "config_field_mappings", :force => true do |t|
    t.integer  "config_field_id",              :null => false
    t.boolean  "to_activity_config_property",  :null => false
    t.string   "activity_config_property_ref"
    t.boolean  "to_component_port",            :null => false
    t.integer  "component_port_id"
    t.boolean  "to_processor_port",            :null => false
    t.string   "processor_port_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "config_field_mappings", ["config_field_id"], :name => "index_config_field_mappings_on_config_field_id"

  create_table "config_field_options", :force => true do |t|
    t.integer  "config_field_id", :null => false
    t.string   "label",           :null => false
    t.string   "value",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "config_field_options", ["config_field_id"], :name => "index_config_field_options_on_config_field_id"

  create_table "config_fields", :force => true do |t|
    t.string   "component_id",           :limit => 36,                          :null => false
    t.string   "name",                                                          :null => false
    t.string   "label",                                                         :null => false
    t.text     "description",            :limit => 16777215
    t.integer  "field_type_cd",          :limit => 1,                           :null => false
    t.string   "data_type",                                                     :null => false
    t.string   "config_group"
    t.boolean  "required",                                   :default => true
    t.text     "default_value"
    t.boolean  "fixed",                                      :default => false
    t.boolean  "hidden",                                     :default => false
    t.boolean  "multiple",                                   :default => false
    t.boolean  "constrained_to_options",                     :default => false
    t.text     "additional_constraints"
    t.boolean  "make_input_port",                            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "config_fields", ["component_id"], :name => "index_config_fields_on_component_id"

  create_table "example_values", :force => true do |t|
    t.integer  "port_id",    :null => false
    t.string   "data_type",  :null => false
    t.text     "value",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "example_values", ["port_id"], :name => "index_example_values_on_port_id"

  create_table "external_resources", :force => true do |t|
    t.string   "resource_ref",                      :null => false
    t.string   "type_ref",                          :null => false
    t.string   "title",                             :null => false
    t.text     "description",   :limit => 16777215
    t.string   "discovery_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "external_resources", ["resource_ref"], :name => "index_external_resources_on_resource_ref", :unique => true

  create_table "helpers", :force => true do |t|
    t.integer  "port_id",                         :null => false
    t.string   "label",                           :null => false
    t.string   "title",                           :null => false
    t.text     "description", :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "helpers", ["port_id"], :name => "index_helpers_on_port_id"

  create_table "port_mappings", :force => true do |t|
    t.integer  "port_id",            :null => false
    t.boolean  "to_processor_port",  :null => false
    t.string   "processor_port_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "port_mappings", ["port_id"], :name => "index_port_mappings_on_port_id"

  create_table "ports", :force => true do |t|
    t.string   "component_id",  :limit => 36,                         :null => false
    t.integer  "usage_type_cd", :limit => 1,                          :null => false
    t.string   "name",                                                :null => false
    t.string   "label",                                               :null => false
    t.text     "description",   :limit => 16777215
    t.integer  "depth"
    t.boolean  "visible",                           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ports", ["component_id", "usage_type_cd"], :name => "index_ports_on_component_id_and_usage_type_cd"
  add_index "ports", ["component_id"], :name => "index_ports_on_component_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "taverna_activities", :force => true do |t|
    t.string   "type_ref",                          :null => false
    t.string   "title",                             :null => false
    t.text     "description",   :limit => 16777215
    t.string   "discovery_url",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taverna_activities", ["type_ref"], :name => "index_taverna_activities_on_type_ref", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "cached_slug"
    t.datetime "deleted_at"
    t.string   "homepage"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
