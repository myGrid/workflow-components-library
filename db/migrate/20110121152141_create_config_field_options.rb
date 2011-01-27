class CreateConfigFieldOptions < ActiveRecord::Migration
  def self.up
    create_table :config_field_options do |t|
      t.belongs_to :config_field, :null => false
      t.string :label, :null => false
      t.string :value, :null => false
      
      t.timestamps
    end
    add_index(:config_field_options, :config_field_id)
  end

  def self.down
    drop_table :config_field_options
  end
end
