# encoding: utf-8
# -*- coding: utf-8 -*-

# ====================
# DNA to RNA
# ====================

Factory.define :dna_to_rna_component, :class => Component do |c|
  c.id '2f90b0d0-e03e-11df-85ca-0800200c9a66'
  c.version '1.0.0'
  c.label 'DNA to RNA'
  c.title 'DNA to RNA Transcriber'
  c.description 'Transcribes a DNA sequence into an RNA sequence'
  c.association :taverna_activity, :factory => :beanshell_activity
  c.association :submitter, :factory => :paul
  c.created_at { DateTime.parse("2010-10-26T13:15:30Z") }
  c.updated_at { DateTime.parse("2010-10-26T13:15:30Z") }
end

Factory.define :dna_to_rna_input_port, :class => Port do |p|
  p.usage_type :input
  p.name 'dna_seq'
  p.label 'DNA Sequence'
  p.description 'The DNA sequence you want to convert'
  p.depth 0
  p.visible true
end

Factory.define :dna_to_rna_input_port_example_value, :class => ExampleValue do |e|
  e.data_type "http://www.mygrid.org.uk/ontology#DNA_sequence"
  e.value "CGGTA"
end

Factory.define :dna_to_rna_input_port_mapping, :class => PortMapping do |p|
  p.to_processor_port true
  p.processor_port_ref "dna_seq"
end

Factory.define :dna_to_rna_config_field, :class => ConfigField do |f|
  f.name "script"
  f.label "script"
  f.field_type :text
  f.data_type "http://www.w3.org/2001/XMLSchema#string"
  f.description "The script to run"
  f.config_group nil
  f.required true
  f.default_value "﻿import org.biojava.bio.seq.DNATools;\nimport org.biojava.bio.seq.RNATools;\nimport org.biojava.bio.symbol.SymbolList;\n\n// make a DNA SymbolList\nSymbolList symL = DNATools.createDNA(dna_seq);\n\n// transcribe it to RNA (after BioJava 1.4 this method is\n// deprecated)\nsymL = RNATools.transcribe(symL);\n\n// (after BioJava 1.4 use this method instead)\n// symL = DNATools.toRNA(symL);\n\n// just to prove it worked\nrna_seq = symL.seqString();"
  f.fixed true
  f.hidden true
  f.multiple false
  f.constrained_to_options false
  f.additional_constraints nil
  f.make_input_port false
end

Factory.define :dna_to_rna_config_field_mapping, :class => ConfigFieldMapping do |c|
  c.to_activity_config_property true
  c.activity_config_property_ref "script"
  c.to_component_port false
  c.to_processor_port false
end

# ====================