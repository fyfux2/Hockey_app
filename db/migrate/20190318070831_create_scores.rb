class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.references :home_team 
      t.references :guest_team
      t.integer :home_goals
      t.integer :guest_goals
      t.boolean :extra_time

      t.timestamps
    end
  end
end
