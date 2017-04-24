class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :topic_id
      t.integer :belt_id

      t.timestamps null: false
    end
  end
end
