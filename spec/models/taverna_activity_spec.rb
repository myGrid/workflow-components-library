# == Schema Information
# Schema version: 20110126113319
#
# Table name: taverna_activities
#
#  id            :integer(4)      not null, primary key
#  type          :string(255)     not null
#  title         :string(255)     not null
#  description   :text(16777215)
#  discovery_url :string(255)     not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_taverna_activities_on_type  (type) UNIQUE
#

require 'spec_helper'

describe TavernaActivity do
  
  it "should not allow duplicates" do 
    type_value = "http://example.org/types#myActivity"
    
    activity1 = Factory.build(:taverna_activity, :type => type_value)
    expect { activity1.save! }.to_not raise_error
    
    activity2 = Factory.build(:taverna_activity, :type => type_value)
    expect { activity2.save! }.to raise_error
    
    expect { Factory.create(:taverna_activity, :type => type_value) }.to raise_error
    
    expect { Factory.create(:taverna_activity, :type => type_value + "123") }.to_not raise_error
  end
  
end
