class CreateHelpers < ActiveRecord::Migration
  def self.up
    create_table :helpers do |t|
      t.belongs_to :port, :null => false
      t.string :label, :null => false
      t.string :title, :null => false
      t.text :description, :limit => 100000
      
      t.timestamps
    end
    add_index(:helpers, :port_id)
  end

  def self.down
    drop_table :helpers
  end
end
