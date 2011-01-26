class CreateConfigFieldOptions < ActiveRecord::Migration
  def self.up
    create_table :config_field_options do |t|
      t.string :label, :null => false
      t.string :value, :null => false
      t.belongs_to :config_field
      
      t.timestamps
    end
  end

  def self.down
    drop_table :config_field_options
  end
end
