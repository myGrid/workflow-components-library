# DNA to RNA

Factory.define :dna_to_rna, :class => Component do |c|
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