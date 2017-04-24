class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
