class CreateTavernaActivities < ActiveRecord::Migration
  def self.up
    create_table :taverna_activities do |t|
      t.string :type_ref, :null => false
      t.string :title, :null => false
      t.text :description, :limit => 100000
      t.string :discovery_url, :null => false
      
      t.timestamps
    end
    add_index(:taverna_activities, :type_ref, :unique => true)
  end

  def self.down
    drop_table :taverna_activities
  end
end
