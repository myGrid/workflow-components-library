# encoding: utf-8
# -*- coding: utf-8 -*-

module Test
  module Data
    module Components
      
      DNA_TO_RNA = { 
        :id => "#{Settings.site.base_url}/components/2f90b0d0-e03e-11df-85ca-0800200c9a66",
        :version => "1.0.0",
        :label => "DNA to RNA",
        :title => "DNA to RNA Transcriber",
        :description => "Transcribes a DNA sequence into an RNA sequence",
        :alternative_labels => [ 
          "DNA 2 RNA", 
          "DNA2RNA"
        ],
        :taverna_activity => {
          :type => "http://ns.taverna.org.uk/2010/taverna/activities/beanshell#Activity",
          :discovery_url => "http://www.taverna.org.uk"
        },
        :creator => {
          :resource => "#{Settings.site.base_url}/users/2",
          :name => "Paul Johnson",
          :homepage => "http://www.example.org/paul_johnson"
        },
        :publisher => {
          :resource => Settings.site.base_url,
          :title => Settings.site.name
        },
        :source => { },
        :credits => [ ],
        :attributions => [ ],
        :created => "2010-10-26T13:15:30Z",
        :modified => "2010-10-26T13:15:30Z",
        :family => { },
        :groups => [
          "/Sequencing",
          "/Convertors/Sequencing",
          "/Convertors/DNA"
        ],
        :icons => {
          :main => "platform:/plugin/uk.org.taverna.t3.workbench.ui/icons/famfamfam_silk/database_go.png"
        },
        :docs => [ ],
        :tags => [
          "DNA",
          "RNA",
          "Convertor",
          "Sequence",
          "Transformation"
        ],
        :related => [ ],
        :ports => {
          :inputs => [
            {
              :relative_id => "ports/inputs/dna_seq",
              :name => "dna_seq",
              :label => "DNA Sequence",
              :description => "The DNA sequence you want to convert",
              :depth => 0,
              :visible => true,
              :data_types => [
                "http://www.mygrid.org.uk/ontology#DNA_sequence"
              ],
              :examples => [
                {
                  :data_type => "http://www.mygrid.org.uk/ontology#DNA_sequence",
                  :value => "CGGTA"
                }
              ],
              :tags => [
                "DNA",
                "Sequence"
              ],
              :mapping => {
                :to_processor_port => true,
                :processor_port => {
                  :name => "dna_seq"
                }
              }
            }
          ],
          :outputs => [
            {
              :relative_id => "ports/outputs/rna_seq",
              :name => "rna_seq",
              :label => "RNA Sequence",
              :description => "The resulting RNA sequence",
              :depth => 0,
              :visible => true,
              :data_types => [
                "http://www.mygrid.org.uk/ontology#RNA_structure"
              ],
              :examples => [ ],
              :tags => [
                "RNA",
                "Sequence"
              ],
              :mapping => {
                :to_processor_port => true,
                :processor_port => {
                  :name => "rna_seq"
                }
              }
            }
          ]
        },
        :configuration => {
          :fields => [
            {
              :relative_id => "configuration/fields/script",
              :name => "script",
              :label => "script",
              :field_type => "TEXT",
              :data_type => "http://www.w3.org/2001/XMLSchema#string",
              :description => "The script to run",
              :config_group => nil,
              :required => true,
              :default_value => "﻿import org.biojava.bio.seq.DNATools;\nimport org.biojava.bio.seq.RNATools;\nimport org.biojava.bio.symbol.SymbolList;\n\n// make a DNA SymbolList\nSymbolList symL = DNATools.createDNA(dna_seq);\n\n// transcribe it to RNA (after BioJava 1.4 this method is\n// deprecated)\nsymL = RNATools.transcribe(symL);\n\n// (after BioJava 1.4 use this method instead)\n// symL = DNATools.toRNA(symL);\n\n// just to prove it worked\nrna_seq = symL.seqString();",
              :fixed => true,
              :hidden => true,
              :multiple => false,
              :constrained_to_options => false,
              :options => [ ],
              :additional_constraints => nil,
              :examples => [ ],
              :mapping => {
                :to_activity_configuration_property => true,
                :activity_configuration_property => {
                  :name => "script"
                },
                :to_component_port => false,
                :component_port => { 
                  :resource => nil
                },
                :to_processor_port => false,
                :processor_port => { 
                  :name => nil
                }
              },
              :make_input_port => false
            }
          ]
        },
        :helpers => [ ]
      }.freeze      
      
    end
  end
end