class CreatePlayers < ActiveRecord::Migration[6.1]
  def self.up
    create_table :players do |t|
      t.string :name
      t.integer :no_of_clicks
      t.text :time_taken
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
