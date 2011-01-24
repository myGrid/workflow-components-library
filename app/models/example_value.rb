# == Schema Information
# Schema version: 20110121152141
#
# Table name: example_values
#
#  id         :integer(4)      not null, primary key
#  data_type  :string(255)     not null
#  value      :text            default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

class ExampleValue < ActiveRecord::Base
  
  include DatabaseValidation
  
end
