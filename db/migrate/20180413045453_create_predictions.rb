class CreatePredictions < ActiveRecord::Migration[5.1]
  def change
    create_table :predictions do |t|
      t.integer :prediction_set_id
      t.integer :match_id
      t.integer :score1
      t.integer :score2
      t.integer :points

      t.timestamps
    end
  end
end
