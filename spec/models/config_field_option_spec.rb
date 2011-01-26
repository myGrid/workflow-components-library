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

require 'spec_helper'

describe ConfigFieldOption do
  pending "add some examples to (or delete) #{__FILE__}"
end
