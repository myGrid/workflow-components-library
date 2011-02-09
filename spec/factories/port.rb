Factory.define :port do |p|
  p.association :component, :factory => :component
  p.usage_type :input
  p.sequence(:name) { |n| "port_#{n}" }
  p.sequence(:label) { |n| "Port #{n}" }
end