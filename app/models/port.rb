class Port < ActiveRecord::Base
  
  # TODO: check uniqueness of port name within scope of ports and port type of a component
  
  as_enum :usage_type, 
          [ :input, :output ], 
          :column => 'usage_type', 
          :upcase => true
  
  validates_as_enum :usage_type
  
  include DatabaseValidation
  
  validates :component,
            :existence => true
  
  validates_as_enum :usage_type
  
  validates :depth,
            :numericality => { :greater_than_or_equal_to => 0 }
end
