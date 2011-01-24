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
    it "creates a test Component 'DNA to RNA' and ensures that the to_hash method builds the right object" do
      pending "Still TODO"
    end
  end
  
end
