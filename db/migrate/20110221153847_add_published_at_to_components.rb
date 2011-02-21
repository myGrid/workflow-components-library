class AddPublishedAtToComponents < ActiveRecord::Migration
  def self.up
    add_column :components, :published_at, :datetime
  end

  def self.down
    remove_column :components, :published_at
  end
end
