class CreateConfigFieldTypes < ActiveRecord::Migration
  def self.up
    create_table :config_field_types do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :config_field_types
  end
end
