# == Schema Information
# Schema version: 20110121152141
#
# Table name: config_field_mappings
#
#  id                          :integer(4)      not null, primary key
#  to_activity_config_property :boolean(1)
#  activity_config_property_id :string(255)
#  to_component_port           :boolean(1)
#  component_port_id_id        :integer(4)
#  to_processor_port           :boolean(1)
#  processor_port_id           :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#

require 'spec_helper'

describe ConfigFieldMapping do
  pending "add some examples to (or delete) #{__FILE__}"
end
