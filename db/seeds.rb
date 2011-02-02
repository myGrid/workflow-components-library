# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# Setup initial user so we can get in
ActiveRecord::Base.transaction do
  if User.count == 0 && Role.count == 0
    user = User.create! :id => 1, :name => "Admin", :email => "admin@example.org", :password => "password", :password_confirmation => "password"
    user.confirmed_at = user.confirmation_sent_at
    user.save!
    
    role1 = Role.new :name => 'Admin'
    role1.id = 1
    role1.save!
    
    role2 = Role.new :name => 'Member'
    role2.id = 2
    role2.save!
    
    user.role_ids = [1,2]
    user.save!
  end
  
  # Create some Taverna Activities
  if TavernaActivity.count == 0
    taverna_discovery_url = "http://taverna.org.uk"
    
    a1 = TavernaActivity.new :title => "Nested Workflow", 
                             :type_ref => "http://ns.taverna.org.uk/2010/taverna/activities/nested-workflow#Activity", 
                             :description => "Allows processors in a workflow to wrap existing Taverna workflows",
                             :discovery_url => taverna_discovery_url
    a1.id = 1
    a1.save!
    
    a2 = TavernaActivity.new :title => "Beanshell", 
                             :type_ref => "http://ns.taverna.org.uk/2010/taverna/activities/beanshell#Activity", 
                             :description => "Allows for Beanshell scripting in Taverna workflows",
                             :discovery_url => taverna_discovery_url
    a2.id = 2
    a2.save!
    
    a3 = TavernaActivity.new :title => "WSDL Activity", 
                             :type_ref => "http://ns.taverna.org.uk/2010/taverna/activities/wsdl#Activity", 
                             :description => "Allows for WSDL/SOAP based services in Taverna workflows",
                             :discovery_url => taverna_discovery_url
    a3.id = 3
    a3.save!
  end
end