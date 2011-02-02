# == Schema Information
# Schema version: 20110126113319
#
# Table name: taverna_activities
#
#  id            :integer(4)      not null, primary key
#  type_ref      :string(255)     not null
#  title         :string(255)     not null
#  description   :text(16777215)
#  discovery_url :string(255)     not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_taverna_activities_on_type_ref  (type_ref) UNIQUE
#

class TavernaActivity < ActiveRecord::Base
  
  validates :type_ref,
            :uniqueness => true,
            :url => { :allow_blank => false }
  
  validates :discovery_url,
            :url => { :allow_blank => false }
  
  attr_accessible :type_ref,
                  :title,
                  :description,
                  :discovery_url
  
  # Sunspot / Solr configuration
  searchable do
    string :type_ref, :stored => true
    text :title, :default_boost => 5, :stored => true
    text :description, :stored => true
  end
  
end
