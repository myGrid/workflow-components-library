class CreateExternalResources < ActiveRecord::Migration
  def self.up
    create_table :external_resources do |t|
      t.string :resource, :null => false
      t.string :type, :null => false
      t.string :title, :null => false
      t.text :description, :limit => 100000
      t.string :discovery_url
      
      t.timestamps
    end
    add_index(:external_resources, :resource, :unique => true)
  end

  def self.down
    drop_table :external_resources
  end
end
