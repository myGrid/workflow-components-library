# == Schema Information
# Schema version: 20110126113319
#
# Table name: components
#
#  uuid                :string(36)      not null, primary key
#  version             :string(20)      not null
#  label               :string(255)     not null
#  title               :string(255)     not null
#  taverna_activity_id :integer(4)      not null
#  submitter_id        :integer(4)      not null
#  submitter_type      :string(255)     not null
#  description         :text(16777215)
#  family_id           :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_components_on_uuid  (uuid)
#

# encoding: utf-8
# -*- coding: utf-8 -*-

class Component < ActiveRecord::Base
  
  uuid_as_id
  
  has_submitter
  
  default_value_for :version, "0.0.0"
  
  include DatabaseValidation
  
  validates :taverna_activity,
            :existence => true
            
  attr_accessible :label, 
                  :title, 
                  :taverna_activity_id, 
                  :submitter_id, 
                  :submitter_type, 
                  :description, 
                  :family_id
  
  has_version_field

  belongs_to :taverna_activity
  
  has_many :ports     # Should NOT usually use this association directly!
  
  has_many :input_ports,
           :class_name => "Port",
           :conditions => { :usage_type_cd => Port.usage_types.input },
           :dependent => :destroy
  
  has_many :output_ports,
           :class_name => "Port",
           :conditions => { :usage_type_cd => Port.usage_types.output },
           :dependent => :destroy
  
  has_many :config_fields,
           :dependent => :destroy
           
  has_many :helpers,
           :through => :ports
  
  # Sunspot / Solr configuration
  # searchable do
  #   text :label, :default_boost => 2
  #   text :title, :default_boost => 2
  #   text :description
  # end
  
  def self.latest(limit=10)
    find(:all,
         :order => "created_at DESC",
         :limit => limit)
  end
  
  def published?
    !published_at.blank?
  end
  
  def publish!
    unless published?
      self['published_at'] = Time.now
      version_bump(:major)
      save!
    end
  end
  
  def unpublish!
    if published?
      self['published_at'] = nil
      save!
    end
  end
  
  def to_hash(options=nil)
    result = { 
      :id => Wcl::Api.uri_for_object(self),
      :version => version,
      :label => label,
      :title => title,
      :description => description,
      :alternative_labels => [ "DNA 2 RNA", "DNA2RNA" ],   # FIXME: stubbed
      :taverna_activity => {
        :type => taverna_activity.type_ref,
        :discovery_url => taverna_activity.discovery_url
      },
      :creator => {
        :resource => Wcl::Api.uri_for_object(submitter),
        :name => submitter_name,
        :homepage => submitter.try(:homepage)
      },
      :publisher => {
        :resource => Settings.site.base_url,
        :title => Settings.site.name
      },
      :source => { },   # FIXME: stubbed
      :credits => [ ],   # FIXME: stubbed
      :attributions => [ ],   # FIXME: stubbed
      :created => created_at.iso8601,
      :modified => updated_at.iso8601,
      :family => { },   # FIXME: stubbed
      :groups => [   # FIXME: stubbed
        "/Sequencing",
        "/Convertors/Sequencing",
        "/Convertors/DNA"
      ],
      :icons => {   # FIXME: stubbed
        :main => "platform:/plugin/uk.org.taverna.t3.workbench.ui/icons/famfamfam_silk/database_go.png"
      },
      :docs => [ ],   # FIXME: stubbed
      :tags => [   # FIXME: stubbed
        "DNA",
        "RNA",
        "Convertor",
        "Sequence",
        "Transformation"
      ],
      :related => [ ],   # FIXME: stubbed
      :ports => {
        :inputs => input_ports.map { |p| p.to_hash },
        :outputs => [    # FIXME: stubbed
          {
            :relative_id => "ports/outputs/rna_seq",
            :name => "rna_seq",
            :label => "RNA Sequence",
            :description => "The resulting RNA sequence",
            :depth => 0,
            :visible => true,
            :data_types => [
              "http://www.mygrid.org.uk/ontology#RNA_structure"
            ],
            :examples => [ ],
            :tags => [
              "RNA",
              "Sequence"
            ],
            :mapping => {
              :to_processor_port => true,
              :processor_port => {
                :name => "rna_seq"
              }
            }
          }
        ]
      },
      :configuration => {
        :fields => config_fields.map { |f| f.to_hash }
      },
      :helpers => helpers.map { |h| h.to_hash }
    }
    
    return result
  end
  
  alias :as_json :to_hash
  
end
