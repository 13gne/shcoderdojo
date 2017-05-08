class CreateBelts < ActiveRecord::Migration
  def change
    create_table :belts do |t|
      t.string :name
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
