class AddFlaggedMineToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :flagged_mine, :integer ,:default => 0
    add_column :games, :sweep_count, :integer, :default =>0
  end
end
