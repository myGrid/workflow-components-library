# == Schema Information
# Schema version: 20110126113319
#
# Table name: config_field_options
#
#  id              :integer(4)      not null, primary key
#  config_field_id :integer(4)      not null
#  label           :string(255)     not null
#  value           :string(255)     not null
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_config_field_options_on_config_field_id  (config_field_id)
#

class ConfigFieldOption < ActiveRecord::Base
end
