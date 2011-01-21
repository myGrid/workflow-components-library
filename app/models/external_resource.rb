class ExternalResource < ActiveRecord::Base
  
  include DatabaseValidation
  
  validates :resource_id,
            :url => { :allow_blank => false }
  
  validates :discovery_url,
            :url => { :allow_blank => true }
  
end