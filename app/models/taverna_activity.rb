class TavernaActivity < ActiveRecord::Base
  
  include DatabaseValidation
  
  validates :type_id,
            :url => { :allow_blank => false }
  
  validates :discovery_url,
            :url => { :allow_blank => true }
  
end
