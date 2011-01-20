class Component < ActiveRecord::Base
  
  uuid_as_id
  
  has_submitter
  
  default_value_for :version, "0.0.1"
  
  validates :version,
            :presence => true,
            :length => { :maximum => 20 }
            
  validates :label,
            :presence => true,
            :length => { :maximum => 255 }
            
  validates :title,
            :presence => true,
            :length => { :maximum => 255 }
  
  validates :taverna_activity,
            :existence => true

  belongs_to :taverna_activity
    
end
