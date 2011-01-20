class CreateConfigFieldMappings < ActiveRecord::Migration
  def self.up
    create_table :config_field_mappings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :config_field_mappings
  end
end
