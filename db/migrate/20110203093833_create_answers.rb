class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :component_id, :limit  => 36, :null => false
      t.belongs_to :question, :null => false
      t.text :value, :null => false
      t.belongs_to :user, :null => false
            
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
