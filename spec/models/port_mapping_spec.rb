# == Schema Information
# Schema version: 20110114170623
#
# Table name: port_mappings
#
#  id                 :integer(4)      not null, primary key
#  port_id            :integer(4)      not null
#  to_processor_port  :boolean(1)      not null
#  processor_port_ref :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_port_mappings_on_port_id  (port_id)
#

require 'spec_helper'

describe PortMapping do
  pending "add some examples to (or delete) #{__FILE__}"
end
