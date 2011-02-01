# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# Setup initial user so we can get in
if User.count == 0
  user = User.create! :id => 1, :name => "Admin", :email => "admin@example.org", :password => "password", :password_confirmation => "password"
  user.confirmed_at = user.confirmation_sent_at
  user.save
  Role.create! :name => 'Admin'
  Role.create! :name => 'Member'
  
  user1 = User.find_by_email('admin@example.org')
  user1.role_ids = [1,2]
  user1.save
end

# Create some Taverna Activities
if TavernaActivity.count == 0
  taverna_discovery_url = "http://taverna.org.uk"
  TavernaActivity.create! :id => 1,
                          :title => "Nested Workflow", 
                          :type => "http://ns.taverna.org.uk/2010/taverna/activities/nested-workflow#Activity", 
                          :description => "Allows processors in a workflow to wrap existing Taverna workflows"
  TavernaActivity.create! :id => 2,
                          :title => "Beanshell", 
                          :type => "http://ns.taverna.org.uk/2010/taverna/activities/beanshell#Activity", 
                          :description => "Allows for Beanshell scripting in Taverna workflows"
  TavernaActivity.create! :id => 3,
                          :title => "WSDL Activity", 
                          :type => "http://ns.taverna.org.uk/2010/taverna/activities/wsdl#Activity", 
                          :description => "Allows for WSDL/SOAP based services in Taverna workflows"
end