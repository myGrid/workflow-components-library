# == Schema Information
# Schema version: 20110114170623
#
# Table name: ports
#
#  id            :integer(4)      not null, primary key
#  component_id  :string(36)      not null
#  usage_type_cd :integer(1)      not null
#  name          :string(255)     not null
#  label         :string(255)     not null
#  description   :text(16777215)
#  depth         :integer(4)
#  visible       :boolean(1)      default(TRUE)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_ports_on_component_id                    (component_id)
#  index_ports_on_component_id_and_usage_type_cd  (component_id,usage_type_cd)
#

class Port < ActiveRecord::Base
  
  # TODO: check uniqueness of port name within scope of ports and port type of a component
  
  as_enum :usage_type, [ :input, :output ], :upcase => true
  
  default_value_for :depth, 0
  
  default_scope :include => :mapping
  
  include DatabaseValidation
  
  validates_as_enum :usage_type
  
  validates :component,
            :existence => true
  
  validates :depth,
            :numericality => { :greater_than_or_equal_to => 0 }
  
  attr_accessible :component_id,
                  :name,
                  :label,
                  :description,
                  :depth,
                  :visible
     
  belongs_to :component
  
  has_many :helpers
  
  has_many :example_values,
           :dependent => :destroy
  
  has_one :mapping,
          :class_name => 'PortMapping',
          :dependent => :destroy,
          :autosave => true
  
  before_create :ensure_mapping
  
  def to_hash
    {
      :relative_id => "ports/#{self.usage_type.to_s.pluralize}/#{self.name}",
      :name => self.name,
      :label => self.label,
      :description => self.description,
      :depth => self.depth,
      :visible => self.visible,
      :data_types => [   # FIXME: stubbed
        "http://www.mygrid.org.uk/ontology#DNA_sequence"
      ],
      :examples => self.example_values.map { |e| e.to_hash },
      :tags => [   # FIXME: stubbed
        "DNA",
        "Sequence"
      ],
      :mapping => {
        :to_processor_port => self.mapping.to_processor_port,
        :processor_port => {
          :name => self.mapping.processor_port_ref
        }
      }
    }
  end
  
  protected
  
  def ensure_mapping
    if mapping
      return true
    else
      build_mapping
    end
  end
  
end
