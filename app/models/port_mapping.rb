# == Schema Information
# Schema version: 20110121152141
#
# Table name: port_mappings
#
#  id                 :integer(4)      not null, primary key
#  to_processor_port  :boolean(1)
#  processor_port_ref :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class PortMapping < ActiveRecord::Base
  
  include DatabaseValidation
  
  validates :processor_port_id,
            :url => { :allow_blank => true }

end
