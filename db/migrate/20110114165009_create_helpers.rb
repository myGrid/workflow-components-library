class CreateHelpers < ActiveRecord::Migration
  def self.up
    create_table :helpers do |t|
      t.string :label, :null => false
      t.string :title, :null => false
      t.text :description, :limit => 100000
      
      t.timestamps
    end
  end

  def self.down
    drop_table :helpers
  end
end
