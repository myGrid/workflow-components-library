# == Schema Information
# Schema version: 20110126113319
#
# Table name: taverna_activities
#
#  id            :integer(4)      not null, primary key
#  type          :string(255)     not null
#  title         :string(255)     not null
#  description   :text(16777215)
#  discovery_url :string(255)     not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_taverna_activities_on_type  (type) UNIQUE
#

class TavernaActivity < ActiveRecord::Base
  
  include DatabaseValidation
  
  validates :type,
            :uniqueness => true,
            :url => { :allow_blank => false }
  
  validates :discovery_url,
            :url => { :allow_blank => true }
  
end
