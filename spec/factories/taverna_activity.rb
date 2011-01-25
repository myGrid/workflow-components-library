Factory.define :taverna_activity do |t|
  t.sequence(:type_id) { |n| "http://example.org/taverna_activity/#{n}" }
  t.sequence(:title) { |n| "Taverna Activity #{n}"}
  t.sequence(:discovery_url) { |n| "http://taverna.org" }
end