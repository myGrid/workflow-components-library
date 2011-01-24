# Component

Factory.define :component do |c|
  c.sequence(:label) { |n| "Component #{n}" }
  c.sequence(:title) { |n| "This is component #{n}" }
  c.association :submitter, :factory => :member
  c.association :taverna_activity
end


# TavernaActivity

Factory.define :taverna_activity do |t|
  t.sequence(:type_id) { |n| "http://example.org/taverna_activity/#{n}" }
  t.sequence(:title) { |n| "Taverna Activity #{n}"}
  t.sequence(:discovery_url) { |n| "http://taverna.org" }
end