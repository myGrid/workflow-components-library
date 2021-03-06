# == Schema Information
# Schema version: 20110114170623
#
# Table name: config_fields
#
#  id                     :integer(4)      not null, primary key
#  component_id           :string(36)      not null
#  name                   :string(255)     not null
#  label                  :string(255)     not null
#  description            :text(16777215)
#  field_type_cd          :integer(1)      not null
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
# Indexes
#
#  index_config_fields_on_component_id  (component_id)
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
          :upcase => true
  
  default_scope :include => :mapping
  
  include DatabaseValidation
  
  validates_as_enum :field_type

  validates :component,
            :existence => true
  
  validates :data_type,
            :url => { :allow_blank => false }
  
  attr_accessible :component_id,
                  :name,
                  :label,
                  :description,
                  :field_type_cd,
                  :data_type,
                  :config_group,
                  :required,
                  :default_value,
                  :fixed,
                  :hidden,
                  :multiple,
                  :constrained_to_options,
                  :additional_constraints,
                  :make_input_port
  
  belongs_to :component
  
  has_one :mapping,
          :class_name => 'ConfigFieldMapping',
          :dependent => :destroy,
          :autosave => true
  
  before_create :ensure_mapping
  
  def to_hash
    {
      :relative_id => "configuration/fields/#{name}",
      :name => name,
      :label => label,
      :field_type => field_type.to_s.upcase,
      :data_type => data_type,
      :description => description,
      :config_group => config_group,
      :required => required,
      :default_value => default_value,
      :fixed => fixed,
      :hidden => hidden,
      :multiple => multiple,
      :constrained_to_options => constrained_to_options,
      :options => [ ],   # FIXME: stubbed
      :additional_constraints => additional_constraints,
      :examples => [ ],    # FIXME: stubbed
      :mapping => {
        :to_activity_configuration_property => mapping.to_activity_config_property,
        :activity_configuration_property => {
          :name => mapping.activity_config_property_ref
        },
        :to_component_port => mapping.to_component_port,
        :component_port => { 
          :resource => nil  # FIXME: stubbed
        },
        :to_processor_port => mapping.to_processor_port,
        :processor_port => {
          :name => mapping.processor_port_ref
        }
      },
      :make_input_port => make_input_port
    }
  end
  
  protected
  
  def ensure_mapping
    if mapping
      return true
    else
      build_mapping
    end
  end
  
end
