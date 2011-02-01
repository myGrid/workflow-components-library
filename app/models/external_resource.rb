# == Schema Information
# Schema version: 20110126113319
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
# Indexes
#
#  index_external_resources_on_resource  (resource) UNIQUE
#

class ExternalResource < ActiveRecord::Base
  
  include DatabaseValidation
  
  validates :resource,
            :uniqueness => true,
            :url => { :allow_blank => false }
  
  validates :discovery_url,
            :url => { :allow_blank => true }
  
end
