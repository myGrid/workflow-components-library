class Component < ActiveRecord::Base
  
  uuid_as_id
  
  has_submitter
  
  default_value_for :version, "0.0.1"
  
  include DatabaseValidation
  
  validates :taverna_activity,
            :existence => true

  belongs_to :taverna_activity

end
