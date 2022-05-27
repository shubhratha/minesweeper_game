class CreateMines < ActiveRecord::Migration[6.1]
  def self.up
        create_table :mines do |t|
          t.integer :x;
          t.integer :y;
          t.references :game, foreign_key: true
          t.timestamps
        end
  end

      def self.down
        drop_table :mines
      end

end
