# == Schema Information
# Schema version: 20110126113319
#
# Table name: components
#
#  uuid                :string(36)      not null, primary key
#  version             :string(20)      not null
#  label               :string(255)     not null
#  title               :string(255)     not null
#  taverna_activity_id :integer(4)      not null
#  submitter_id        :integer(4)      not null
#  submitter_type      :string(255)     not null
#  description         :text(16777215)
#  family_id           :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_components_on_uuid  (uuid)
#

# encoding: utf-8
# -*- coding: utf-8 -*-

class Component < ActiveRecord::Base
  
  uuid_as_id
  
  has_submitter
  
  default_value_for :version, "0.0.0"
  
  validates :taverna_activity,
            :existence => true
            
  attr_accessible :label, 
                  :title, 
                  :taverna_activity_id, 
                  :submitter_id, 
                  :submitter_type, 
                  :description, 
                  :family_id
  
  has_version_field

  belongs_to :taverna_activity
  
  has_many :input_ports,
           :class_name => "Port",
           :conditions => { :usage_type_cd => Port.usage_types.input },
           :dependent => :destroy
  
  has_many :output_ports,
           :class_name => "Port",
           :conditions => { :usage_type_cd => Port.usage_types.output },
           :dependent => :destroy
  
  has_many :config_fields,
           :dependent => :destroy
  
  # Sunspot / Solr configuration
  searchable do
    text :label, :default_boost => 2
    text :title, :default_boost => 2
    text :description
  end
  
  # FIXME: change all keys to symbols (for a slight perf improvement)
  def to_hash
    result = { 
      'id' => Wcl::Api.uri_for_object(self),
      'version' => self.version,
      'label' => self.label,
      'title' => self.title,
      'description' => self.description,
      'alternative_labels' => [ "DNA 2 RNA", "DNA2RNA" ],   # FIXME: stubbed
      'taverna_activity' => {
        'type' => self.taverna_activity.type_ref,
        'discovery_url' => self.taverna_activity.discovery_url
      },
      'creator' => {
        'resource' => Wcl::Api.uri_for_object(self.submitter),
        'name' => self.submitter_name,
        'homepage' => self.submitter.try(:homepage)
      },
      'publisher' => {   # FIXME: stubbed
        'resource' => 'http://components.taverna.org.uk',
        'title' => 'myGrid Workflow Components Library'
      },
      "source" => { },   # FIXME: stubbed
      "credits" => [ ],   # FIXME: stubbed
      "attributions" => [ ],   # FIXME: stubbed
      "created" => self.created_at.iso8601,
      "modified" => self.updated_at.iso8601,
      "family" => { },   # FIXME: stubbed
      "groups" => [   # FIXME: stubbed
        "/Sequencing",
        "/Convertors/Sequencing",
        "/Convertors/DNA"
      ],
      "icons" => {   # FIXME: stubbed
        "main" => "platform:/plugin/uk.org.taverna.t3.workbench.ui/icons/famfamfam_silk/database_go.png"
      },
      "docs" => [ ],   # FIXME: stubbed
      "tags" => [   # FIXME: stubbed
        "DNA",
        "RNA",
        "Convertor",
        "Sequence",
        "Transformation"
      ],
      "related" => [ ],   # FIXME: stubbed
      "ports" => {
        "inputs" => to_hash_for_ports(self.input_ports, :input),
        "outputs" => [
          {
            "relative_id" => "ports/outputs/rna_seq",
            "name" => "rna_seq",
            "label" => "RNA Sequence",
            "description" => "The resulting RNA sequence",
            "depth" => 0,
            "visible" => true,
            "data_types" => [
              "http://www.mygrid.org.uk/ontology#RNA_structure"
            ],
            "examples" => [ ],
            "tags" => [
              "RNA",
              "Sequence"
            ],
            "mapping" => {
              "to_processor_port" => true,
              "processor_port" => {
                "name" => "rna_seq"
              }
            }
          }
        ]
      },
      "configuration" => {
        "fields" => to_hash_for_config_fields(self.config_fields)
      },
      "helpers" => [ ]   # FIXME: stubbed
    }
    
    return result
  end
  
  protected
  
  def to_hash_for_ports(ports, usage_type)
    result = [ ]
    
    ports.each do |port|
      result << {
        "relative_id" => "ports/#{usage_type.to_s.pluralize}/#{port.name}",
        "name" => port.name,
        "label" => port.label,
        "description" => port.description,
        "depth" => port.depth,
        "visible" => port.visible,
        "data_types" => [   # FIXME: stubbed
          "http://www.mygrid.org.uk/ontology#DNA_sequence"
        ],
        "examples" => to_hash_for_example_values(port.example_values),
        "tags" => [   # FIXME: stubbed
          "DNA",
          "Sequence"
        ],
        "mapping" => {
          "to_processor_port" => port.mapping.to_processor_port,
          "processor_port" => {
            "name" => port.mapping.processor_port_ref
          }
        }
      }
    end
    
    return result
  end
  
  def to_hash_for_example_values(example_values)
    result = [ ]
    
    example_values.each do |example|
      result << {
        "data_type" => example.data_type,
        "value" => example.value        
      }
    end
    
    return result
  end
  
  def to_hash_for_config_fields(config_fields)
    result = [ ]
    
    config_fields.each do |field|
      result << {
        "relative_id" => "configuration/fields/#{field.name}",
        "name" => field.name,
        "label" => field.label,
        "field_type" => field.field_type.to_s.upcase,
        "data_type" => field.data_type,
        "description" => field.description,
        "config_group" => field.config_group,
        "required" => field.required,
        "default_value" => field.default_value,
        "fixed" => field.fixed,
        "hidden" => field.hidden,
        "multiple" => field.multiple,
        "constrained_to_options" => field.constrained_to_options,
        "options" => [ ],   # FIXME: stubbed
        "additional_constraints" => field.additional_constraints,
        "examples" => [ ],    # FIXME: stubbed
        "mapping" => {
          "to_activity_configuration_property" => field.mapping.to_activity_config_property,
          "activity_configuration_property" => {
            "name" => field.mapping.activity_config_property_ref
          },
          "to_component_port" => field.mapping.to_component_port,
          "component_port" => { 
            "resource" => nil   # FIXME: stubbed
          },
          "to_processor_port" => field.mapping.to_processor_port,
          "processor_port" => {
            "name" => field.mapping.processor_port_ref
          }
        },
        "make_input_port" => field.make_input_port
      }
    end
    
    return result
  end
  
end
