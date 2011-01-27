class CreateConfigFieldMappings < ActiveRecord::Migration
  def self.up
    create_table :config_field_mappings do |t|
      t.belongs_to :config_field, :null => false
      t.boolean :to_activity_config_property, :null => false
      t.string :activity_config_property_ref
      t.boolean :to_component_port, :null => false
      t.references :component_port
      t.boolean :to_processor_port, :null => false
      t.string :processor_port_ref
      
      t.timestamps
    end
    add_index(:config_field_mappings, :config_field_id)
  end

  def self.down
    drop_table :config_field_mappings
  end
end
