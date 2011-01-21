class PortMapping < ActiveRecord::Base
  
  include DatabaseValidation
  
  validates :processor_port_id,
            :url => { :allow_blank => true }

end
