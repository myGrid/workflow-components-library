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

require 'spec_helper'

describe Component do
  
  describe "#create_and_find_empty_one" do
    it "creates then finds an 'empty' Component (to test simple creation of Component and UUID as primary key)" do
      component = Factory.build(:component)
      component.save!
      
      component_again = Component.find(component.id)
      
      component_again.should == component
    end
  end
  
  describe "#create_dna_to_rna_test_component" do
    it "creates a test Component 'DNA to RNA' and checks that the to_hash method builds the right object" do
      component = Factory.build(:dna_to_rna)
      component.save!
      
      component.to_hash.should == Test::Data::Components::DNA_TO_RNA 
    end
  end
  
end
