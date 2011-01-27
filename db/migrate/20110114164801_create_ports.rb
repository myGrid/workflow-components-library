class CreatePorts < ActiveRecord::Migration
  def self.up
    create_table :ports do |t|
      t.string :component_id, :limit  => 36, :null => false
      t.integer :usage_type_cd, :null => false, :limit => 1
      t.string :name, :null => false
      t.string :label, :null => false
      t.text :description, :limit => 100000
      t.integer :depth
      t.boolean :visible, :default => true
      
      t.timestamps
    end
    add_index(:ports, :component_id)
    add_index(:ports, [ :component_id, :usage_type_cd ])
  end

  def self.down
    drop_table :ports
  end
end
