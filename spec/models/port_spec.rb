# == Schema Information
# Schema version: 20110121152141
#
# Table name: ports
#
#  id           :integer(4)      not null, primary key
#  component_id :integer(4)      not null
#  usage_type   :integer(1)      not null
#  name         :string(255)     not null
#  label        :string(255)     not null
#  description  :text(16777215)
#  depth        :integer(4)
#  visible      :boolean(1)      default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Port do
  
  describe "#create_one" do
    it "creates a Port and saves it" do
      
    end
  end

end
