# == Schema Information
# Schema version: 20110126113319
#
# Table name: external_resources
#
#  id            :integer(4)      not null, primary key
#  resource_ref  :string(255)     not null
#  type_ref      :string(255)     not null
#  title         :string(255)     not null
#  description   :text(16777215)
#  discovery_url :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_external_resources_on_resource_ref  (resource_ref) UNIQUE
#

require 'spec_helper'

describe ExternalResource do
  pending "add some examples to (or delete) #{__FILE__}"
end
