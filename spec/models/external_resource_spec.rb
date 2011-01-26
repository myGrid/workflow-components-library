# == Schema Information
# Schema version: 20110121152141
#
# Table name: external_resources
#
#  id            :integer(4)      not null, primary key
#  resource      :string(255)     not null
#  type          :string(255)     not null
#  title         :string(255)     not null
#  description   :text(16777215)
#  discovery_url :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe ExternalResource do
  pending "add some examples to (or delete) #{__FILE__}"
end
