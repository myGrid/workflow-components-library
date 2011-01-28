RailsConfig.setup do |config|
  config.const_name = "Settings"
end

customised_settings_path = Rails.root.join "config/settings/customised.rb"
if File.exist? customised_settings_path 
  Settings.add_source! customised_settings_path 
  Settings.reload!
end

