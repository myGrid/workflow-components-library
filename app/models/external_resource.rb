class ExternalResource < ActiveRecord::Base
  
  validates :resource_id,
            :presence => true,
            :url => { :allow_blank => false }
  
  validates :type,
            :presence => true
            
  validates :title,
            :presence => true,
            :length => { :maximum => 255 }
  
  validates :discovery_url,
            :url => { :allow_blank => true }
  
end