class AddCountTouchingMineToTiles < ActiveRecord::Migration[6.1]
  def change
    add_column :tiles, :count_touching_mine, :integer
  end
end
