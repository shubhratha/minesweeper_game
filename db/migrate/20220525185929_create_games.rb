class CreateGames < ActiveRecord::Migration[6.1]
  def self.up
    create_table :games do |t|
      t.string :username
      t.integer :no_of_clicks
      t.text :time_taken
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
