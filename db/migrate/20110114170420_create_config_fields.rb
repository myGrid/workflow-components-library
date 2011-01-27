class CreateConfigFields < ActiveRecord::Migration
  def self.up
    create_table :config_fields do |t|
      t.string :component_id, :limit  => 36, :null => false
      t.string :name, :null => false
      t.string :label, :null => false
      t.text :description, :limit => 100000
      t.integer :field_type_cd, :null => false, :limit => 1
      t.string :data_type, :null => false
      t.string :config_group
      t.boolean :required, :default => true
      t.text :default_value
      t.boolean :fixed, :default => false
      t.boolean :hidden, :default => false
      t.boolean :multiple, :default => false
      t.boolean :constrained_to_options, :default => false
      t.text :additional_constraints, :limit => 20000
      t.boolean :make_input_port, :default => false

      t.timestamps
    end
    add_index(:config_fields, :component_id)
  end

  def self.down
    drop_table :config_fields
  end
end
