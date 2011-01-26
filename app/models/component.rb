# encoding: utf-8
# -*- coding: utf-8 -*-

# == Schema Information
# Schema version: 20110121152141
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

class Component < ActiveRecord::Base
  
  uuid_as_id
  
  has_submitter
  
  default_value_for :version, "0.0.1"
  
  include DatabaseValidation
  
  validates :taverna_activity,
            :existence => true

  belongs_to :taverna_activity
  
  def to_hash
    output = { 
      'id' => Wcl::Api.uri_for_object(self),
      'version' => self.version,
      'label' => self.label,
      'title' => self.title,
      'description' => self.description,
      'alternative_labels' => [ "DNA 2 RNA", "DNA2RNA" ],   # FIXME: stubbed
      'taverna_activity' => {
        'type' => self.taverna_activity.type,
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
        "inputs" => [
          {
            "relative_id" => "ports/inputs/dna_seq",
            "name" => "dna_seq",
            "label" => "DNA Sequence",
            "depth" => 0,
            "description" => "The DNA sequence you want to convert",
            "visible" => true,
            "data_types" => [
              "http://www.mygrid.org.uk/ontology#DNA_sequence"
            ],
            "examples" => [
              {
                "data_type" => "http://www.mygrid.org.uk/ontology#DNA_sequence",
                "value" => "CGGTA"
              }
            ],
            "tags" => [
              "DNA",
              "Sequence"
            ],
            "mapping" => {
              "to_processor_port" => true,
              "processor_port" => {
                "name" => "dna_seq"
              }
            }
          }
        ],
        "outputs" => [
          {
            "relative_id" => "ports/outputs/rna_seq",
            "name" => "rna_seq",
            "label" => "RNA Sequence",
            "depth" => 0,
            "description" => "The resulting RNA sequence",
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
        ],
        "dynamic_providers" => [ ]
      },
      "configuration" => {
        "fields" => [
          {
            "relative_id" => "configuration/fields/script",
            "name" => "script",
            "label" => "script",
            "field_type" => "TEXT",
            "data_type" => "String",
            "description" => "The script to run",
            "config_group" => "",
            "required" => true,
            "default_value" => "﻿import org.biojava.bio.seq.DNATools;\nimport org.biojava.bio.seq.RNATools;\nimport org.biojava.bio.symbol.SymbolList;\n\n// make a DNA SymbolList\nSymbolList symL = DNATools.createDNA(dna_seq);\n\n// transcribe it to RNA (after BioJava 1.4 this method is\n// deprecated)\nsymL = RNATools.transcribe(symL);\n\n// (after BioJava 1.4 use this method instead)\n// symL = DNATools.toRNA(symL);\n\n// just to prove it worked\nrna_seq = symL.seqString();",
            "fixed" => true,
            "hidden" => true,
            "multiple" => false,
            "constrained_to_options" => false,
            "options" => [ ],
            "additional_constraints" => "",
            "examples" => [ ],
            "mapping" => {
              "to_activity_configuration_property" => true,
              "activity_configuration_property" => {
                "name" => "script"
              },
              "to_component_port" => false,
              "component_port" => { },
              "to_processor_port" => false,
              "processor_port" => { }
            },
            "make_input_port" => false
          }
        ],
        "dynamic_providers" => [ ]
      },
      "helpers" => [ ]
    }
    
    return output
  end

end
