require 'array'
require 'numeric'
require 'string'
require 'super_struct'
require 'uuid_as_id'
require 'addressable/uri'
require 'has_submitter'
require 'has_version_field'

# ===========
# RailsConfig
# ===========

RailsConfig.setup do |config|
  config.const_name = "Settings"
end

customised_settings_path = Rails.root.join "config/settings/customised.rb"
if File.exist? customised_settings_path 
  Settings.add_source! customised_settings_path 
  Settings.reload!
end

# ===========
