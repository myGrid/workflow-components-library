class CreateExampleValues < ActiveRecord::Migration
  def self.up
    create_table :example_values do |t|
      t.belongs_to :port, :null => false
      t.string :data_type, :null => false
      t.text :value, :null => false
      
      t.timestamps
    end
    add_index(:example_values, :port_id)
  end

  def self.down
    drop_table :example_values
  end
end
