class CreateConfigFieldOptions < ActiveRecord::Migration
  def self.up
    create_table :config_field_options do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :config_field_options
  end
end
