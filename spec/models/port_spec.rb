# == Schema Information
# Schema version: 20110114170623
#
# Table name: ports
#
#  id            :integer(4)      not null, primary key
#  component_id  :string(36)      not null
#  usage_type_cd :integer(1)      not null
#  name          :string(255)     not null
#  label         :string(255)     not null
#  description   :text(16777215)
#  depth         :integer(4)
#  visible       :boolean(1)      default(TRUE)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_ports_on_component_id                    (component_id)
#  index_ports_on_component_id_and_usage_type_cd  (component_id,usage_type_cd)
#

require 'spec_helper'

describe Port do
  
  describe "#create_one" do
    it "creates a Port and saves it" do
      
    end
  end

end
