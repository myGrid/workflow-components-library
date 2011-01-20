class CreatePortMappings < ActiveRecord::Migration
  def self.up
    create_table :port_mappings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :port_mappings
  end
end
