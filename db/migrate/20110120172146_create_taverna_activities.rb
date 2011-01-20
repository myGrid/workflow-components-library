class CreateTavernaActivities < ActiveRecord::Migration
  def self.up
    create_table :taverna_activities do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :taverna_activities
  end
end
