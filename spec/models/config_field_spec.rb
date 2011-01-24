# == Schema Information
# Schema version: 20110121152141
#
# Table name: config_fields
#
#  id                     :integer(4)      not null, primary key
#  name                   :string(255)     not null
#  label                  :string(255)     not null
#  description            :text(16777215)
#  field_type             :integer(1)      not null
#  data_type              :string(255)     not null
#  config_group           :string(255)
#  required               :boolean(1)      default(TRUE)
#  default_value          :text
#  fixed                  :boolean(1)      default(FALSE)
#  hidden                 :boolean(1)      default(FALSE)
#  multiple               :boolean(1)      default(FALSE)
#  constrained_to_options :boolean(1)      default(FALSE)
#  additional_constraints :text
#  make_input_port        :boolean(1)      default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe ConfigField do
  pending "add some examples to (or delete) #{__FILE__}"
end
