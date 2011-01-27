# == Schema Information
# Schema version: 20110126113319
#
# Table name: config_field_mappings
#
#  id                           :integer(4)      not null, primary key
#  config_field_id              :integer(4)      not null
#  to_activity_config_property  :boolean(1)      not null
#  activity_config_property_ref :string(255)
#  to_component_port            :boolean(1)      not null
#  component_port_id            :integer(4)
#  to_processor_port            :boolean(1)      not null
#  processor_port_ref           :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#
# Indexes
#
#  index_config_field_mappings_on_config_field_id  (config_field_id)
#

require 'spec_helper'

describe ConfigFieldMapping do
  pending "add some examples to (or delete) #{__FILE__}"
end
