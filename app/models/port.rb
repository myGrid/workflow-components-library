class Port < ActiveRecord::Base
  
  # TODO: check uniqueness of port name within scope of ports and port type of a component
  
  as_enum :usage_type, 
          [ :input, :output ], 
          :column => 'usage_type', 
          :upcase => true
    
  validates :component,
            :existence => true
  
  validates :usage_type,
            :presence => true

  validates_as_enum :usage_type
  
  validates :name,
            :presence => true
  
  validates :label,
            :presence => true
  
  validates :depth,
            :numericality => { :greater_than_or_equal_to => 0 }
end
