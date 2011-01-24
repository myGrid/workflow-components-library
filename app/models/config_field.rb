# == Schema Information
# Schema version: 20110121152141
#
# Table name: config_fields
#
#  id                     :integer(4)      not null, primary key
#  name                   :string(255)     not null
#  label                  :string(255)     not null
#  description            :text(16777215)
#  field_type             :integer(1)      not null
#  data_type              :string(255)     not null
#  config_group           :string(255)
#  required               :boolean(1)      default(TRUE)
#  default_value          :text
#  fixed                  :boolean(1)      default(FALSE)
#  hidden                 :boolean(1)      default(FALSE)
#  multiple               :boolean(1)      default(FALSE)
#  constrained_to_options :boolean(1)      default(FALSE)
#  additional_constraints :text
#  make_input_port        :boolean(1)      default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#

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
