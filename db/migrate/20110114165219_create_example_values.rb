class CreateExampleValues < ActiveRecord::Migration
  def self.up
    create_table :example_values do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :example_values
  end
end
