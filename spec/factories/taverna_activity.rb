Factory.define :taverna_activity do |t|
  t.sequence(:type) { |n| "http://example.org/taverna_activity/#{n}" }
  t.sequence(:title) { |n| "Taverna Activity #{n}"}
  t.sequence(:discovery_url) { |n| "http://taverna.org" }
end

Factory.define :beanshell_activity, :class => TavernaActivity do |a|
  a.type 'http://ns.taverna.org.uk/2010/taverna/activities/beanshell#Activity'
  a.title 'Beanshell Activity'
  a.discovery_url 'http://www.taverna.org.uk'
end