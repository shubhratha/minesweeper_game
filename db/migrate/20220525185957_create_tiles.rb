class CreateTiles < ActiveRecord::Migration[6.1]

  def self.up
    create_table :tiles do |t|
      t.integer :x
      t.integer :y
      t.boolean :flagged, :default => false
      t.boolean :cleared, :default => false
      t.references :game, foreign_key: true
      t.timestamps
    end
  end

  def self.down
    drop_table :tiles
  end
end
