class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :current_score, default: 0
      t.integer :current_roll, defualt: nil
      t.integer :strikes, default: 0
      t.string :outcome
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
