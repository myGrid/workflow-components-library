class Helper < ActiveRecord::Base
  
  # TODO: check uniqueness of helper name within scope of component (and possibly port too)
  
  include DatabaseValidation
  
end
