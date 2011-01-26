# == Schema Information
# Schema version: 20110121152141
#
# Table name: config_field_mappings
#
#  id                           :integer(4)      not null, primary key
#  to_activity_config_property  :boolean(1)
#  activity_config_property_ref :string(255)
#  to_component_port            :boolean(1)
#  component_port_id_id         :integer(4)
#  to_processor_port            :boolean(1)
#  processor_port_ref           :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#

class ConfigFieldMapping < ActiveRecord::Base

  include DatabaseValidation
  
  validates :activity_config_property_id,
            :url => { :allow_blank => true }
            
  validates :processor_port_id,
            :url => { :allow_blank => true }

end
