# == Schema Information
# Schema version: 20110114170623
#
# Table name: example_values
#
#  id         :integer(4)      not null, primary key
#  port_id    :integer(4)      not null
#  data_type  :string(255)     not null
#  value      :text            default(""), not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_example_values_on_port_id  (port_id)
#

require 'spec_helper'

describe ExampleValue do
  pending "add some examples to (or delete) #{__FILE__}"
end
