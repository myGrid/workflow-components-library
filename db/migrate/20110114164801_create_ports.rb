class CreatePorts < ActiveRecord::Migration
  def self.up
    create_table :ports do |t|
      t.belongs_to :component, :null => false
      t.string :usage_type, :null => false
      t.string :name, :null => false
      t.string :label, :null => false
      t.text :description
      t.integer :depth
      t.boolean :visible, :default => true
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ports
  end
end
