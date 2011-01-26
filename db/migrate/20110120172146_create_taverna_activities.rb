class CreateTavernaActivities < ActiveRecord::Migration
  def self.up
    create_table :taverna_activities do |t|
      t.string :type, :null => false
      t.string :title, :null => false
      t.text :description, :limit => 100000
      t.string :discovery_url, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :taverna_activities
  end
end
