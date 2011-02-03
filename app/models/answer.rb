class Answer < ActiveRecord::Base
  
  include DatabaseValidation
  
  validates :component,
            :existence => true
  
  validates :question,
            :existence => true
  
  validates :user,
            :existence => true
           
  attr_accessible :component_id,
                  :question_id,
                  :value,
                  :user_id
                  
  belongs_to :component
  
  belongs_to :question
  
  belongs_to :user
  
end
