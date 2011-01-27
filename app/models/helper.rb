# == Schema Information
# Schema version: 20110114170623
#
# Table name: helpers
#
#  id          :integer(4)      not null, primary key
#  port_id     :integer(4)      not null
#  label       :string(255)     not null
#  title       :string(255)     not null
#  description :text(16777215)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_helpers_on_port_id  (port_id)
#

class Helper < ActiveRecord::Base
  
  # TODO: check uniqueness of helper name within scope of component (and possibly port too)
  
  include DatabaseValidation
  
end
