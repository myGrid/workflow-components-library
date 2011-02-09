# == Schema Information
# Schema version: 20110114170623
#
# Table name: port_mappings
#
#  id                 :integer(4)      not null, primary key
#  port_id            :integer(4)      not null
#  to_processor_port  :boolean(1)      not null
#  processor_port_ref :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_port_mappings_on_port_id  (port_id)
#

class PortMapping < ActiveRecord::Base
  
  include DatabaseValidation
  
  # TODO: validates :processor_port_ref,
  #          :url => { :allow_blank => true }
  
  validates :port,
            :existence => true
  
  attr_accessible :port_id,
                  :port,
                  :to_processor_port,
                  :processor_port_ref
  
  belongs_to :port
  
end
