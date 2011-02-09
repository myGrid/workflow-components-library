Factory.define :component do |c|
  c.sequence(:label) { |n| "Component #{n}" }
  c.sequence(:title) { |n| "This is component #{n}" }
  c.association :submitter, :factory => :user
  c.association :taverna_activity
end


