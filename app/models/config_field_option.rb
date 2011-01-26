# == Schema Information
# Schema version: 20110121152141
#
# Table name: config_field_options
#
#  id              :integer(4)      not null, primary key
#  label           :string(255)     not null
#  value           :string(255)     not null
#  config_field_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class ConfigFieldOption < ActiveRecord::Base
end
