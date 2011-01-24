# == Schema Information
# Schema version: 20110121152141
#
# Table name: example_values
#
#  id         :integer(4)      not null, primary key
#  data_type  :string(255)     not null
#  value      :text            default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe ExampleValue do
  pending "add some examples to (or delete) #{__FILE__}"
end
