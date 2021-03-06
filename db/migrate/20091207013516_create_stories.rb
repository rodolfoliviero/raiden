class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :name
      t.string :description
      t.integer :points
      t.references :project

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
