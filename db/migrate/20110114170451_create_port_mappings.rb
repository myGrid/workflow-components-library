class CreatePortMappings < ActiveRecord::Migration
  def self.up
    create_table :port_mappings do |t|
      t.belongs_to :port, :null => false
      t.boolean :to_processor_port, :null => false
      t.string :processor_port_ref
      
      t.timestamps
    end
    add_index(:port_mappings, :port_id)
  end

  def self.down
    drop_table :port_mappings
  end
end
