class ConfigFieldMapping < ActiveRecord::Base

  include DatabaseValidation
  
  validates :activity_config_property_id,
            :url => { :allow_blank => true }
            
  validates :processor_port_id,
            :url => { :allow_blank => true }

end
