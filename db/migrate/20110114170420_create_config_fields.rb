class CreateConfigFields < ActiveRecord::Migration
  def self.up
    create_table :config_fields do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :config_fields
  end
end
