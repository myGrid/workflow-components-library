class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components, :id => false do |t|
      t.string :uuid, :limit  => 36, :null => false
      t.string :version, :limit => 20, :null => false
      t.string :label, :null => false
      t.string :title, :null => false
      t.references :taverna_activity, :null => false
      t.references :submitter, :polymorphic => true, :null => false
      t.text :description, :limit => 100000
      t.references :family
      
      t.timestamps
    end
    add_index(:components, :uuid)
  end

  def self.down
    drop_table :components
  end
end
