class Question < ActiveRecord::Base
  
  include DatabaseValidation
  
  attr_accessible :value
  
  has_many :answers
  
end
