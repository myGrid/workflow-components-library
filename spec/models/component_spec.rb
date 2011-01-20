require 'spec_helper'

describe Component do
  
  describe "#create_and_find_one" do
    it "creates then finds a Component (to test UUID as primary key)" do
      component = Factory.build(:component)
      component.save!
      
      component_again = Component.find(component.id)
      
      component_again.should == component
    end
  end
  
end
