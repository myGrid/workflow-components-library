class ConfigField < ActiveRecord::Base
  
  # TODO: check uniqueness of config field name within scope of component
  
  as_enum :field_type, 
          { :text => 0, 
            :number => 1, 
            :dropdown => 2, 
            :combo => 3, 
            :check => 4, 
            :radio => 5,
            :complex => 6 }, 
          :column => 'field_type', 
          :upcase => true
  
  validates_as_enum :field_type

  include DatabaseValidation
  
  validates :data_type,
            :url => { :allow_blank => false }

end
