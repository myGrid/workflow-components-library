class CreateExampleValues < ActiveRecord::Migration
  def self.up
    create_table :example_values do |t|
      t.string :data_type, :null => false
      t.text :value, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :example_values
  end
end
