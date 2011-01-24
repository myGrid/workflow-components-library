# == Schema Information
# Schema version: 20110121152141
#
# Table name: helpers
#
#  id          :integer(4)      not null, primary key
#  label       :string(255)     not null
#  title       :string(255)     not null
#  description :text(16777215)
#  created_at  :datetime
#  updated_at  :datetime
#

class Helper < ActiveRecord::Base
  
  # TODO: check uniqueness of helper name within scope of component (and possibly port too)
  
  include DatabaseValidation
  
end
