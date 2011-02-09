Factory.define :config_field do |f|
  f.association :component, :factory => :component
  f.sequence(:name) { |n| "port_#{n}" }
  f.sequence(:label) { |n| "Port #{n}" }
  f.field_type :text
  f.data_type "http://example.org/types/text"
end