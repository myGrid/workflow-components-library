# == Schema Information
# Schema version: 20110121152141
#
# Table name: ports
#
#  id           :integer(4)      not null, primary key
#  component_id :integer(4)      not null
#  usage_type   :integer(1)      not null
#  name         :string(255)     not null
#  label        :string(255)     not null
#  description  :text(16777215)
#  depth        :integer(4)
#  visible      :boolean(1)      default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#

class Port < ActiveRecord::Base
  
  # TODO: check uniqueness of port name within scope of ports and port type of a component
  
  as_enum :usage_type, 
          [ :input, :output ], 
          :column => 'usage_type', 
          :upcase => true
  
  validates_as_enum :usage_type
  
  include DatabaseValidation
  
  validates :component,
            :existence => true
  
  validates_as_enum :usage_type
  
  validates :depth,
            :numericality => { :greater_than_or_equal_to => 0 }
end
