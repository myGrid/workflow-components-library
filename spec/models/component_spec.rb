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

require 'spec_helper'

describe Component do
  
  context "when creating" do
    
    it "should save and be found successfully" do
      # Partly tests the UUID as ID functionality
      
      component = Factory.build(:component)
      expect { component.save! }.to_not raise_error
      
      component_again = Component.find(component.id)
      component_again.should == component
    end
    
  end
  
  context "when deleting" do
    
    it "should delete and create an archived version successfully" do
      component = Factory(:component)
      component_id = component.id
      expect { component.destroy }.to_not raise_error
      
      expect { Component.find(component_id) }.to raise_error
      
      expect { archived_component = Component::Archive.find(component_id) }.to_not raise_error
    end
    
  end
  
  describe "#version" do 
    it "should only be updated in the appropriate way(s)" do
      component = Factory(:component)
      component.version.should == "0.0.0"
      
      component.version_bump(:major)
      expect { component.save! }.to_not raise_error
      component.version.should == "1.0.0"
      
      expect { component.version = "2.0.0" }.to raise_error
      
      component.version_bump(:minor)
      expect { component.save! }.to_not raise_error
      component.version.should == "1.1.0"
    end
  end
  
  describe "#to_hash" do
    it "should build the right Hash for a test Component 'DNA to RNA'" do
      component = Factory(:dna_to_rna_component)
      
      input_port = Factory(:dna_to_rna_input_port, :component => component)
      Factory(:dna_to_rna_input_port_example_value, :port => input_port)
      Factory(:dna_to_rna_input_port_mapping, :port => input_port)
      
      config_field = Factory(:dna_to_rna_config_field, :component => component)
      Factory(:dna_to_rna_config_field_mapping, :config_field => config_field)
     
      component.to_hash.should == Test::Data::Components::DNA_TO_RNA 
    end
  end
  
end
