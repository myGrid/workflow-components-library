class CreateConfigFieldMappings < ActiveRecord::Migration
  def self.up
    create_table :config_field_mappings do |t|
      t.boolean :to_activity_config_property
      t.string :activity_config_property_id
      t.boolean :to_component_port
      t.references :component_port_id
      t.boolean :to_processor_port
      t.string :processor_port_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :config_field_mappings
  end
end
