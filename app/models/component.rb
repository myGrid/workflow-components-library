# == Schema Information
# Schema version: 20110121152141
#
# Table name: components
#
#  uuid                :string(36)      not null, primary key
#  version             :string(20)      not null
#  label               :string(255)     not null
#  title               :string(255)     not null
#  description         :text(16777215)
#  publisher_id        :integer(4)
#  publisher_type      :string(255)
#  source_id           :integer(4)
#  submitter_id        :integer(4)      not null
#  submitter_type      :string(255)     not null
#  family_id           :integer(4)
#  taverna_activity_id :integer(4)      not null
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_components_on_uuid  (uuid)
#

class Component < ActiveRecord::Base
  
  uuid_as_id
  
  has_submitter
  
  default_value_for :version, "0.0.1"
  
  include DatabaseValidation
  
  validates :taverna_activity,
            :existence => true

  belongs_to :taverna_activity

end
