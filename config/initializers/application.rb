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

customised_settings_path = File.join(Rails.root, "config/settings/custom.yml")
if File.exist? customised_settings_path 
  Settings.add_source! customised_settings_path 
  Settings.reload!
else
  Wcl::Util.warn "No custom settings file at #{customised_settings_path} so using defaults only"
end

# ===========
