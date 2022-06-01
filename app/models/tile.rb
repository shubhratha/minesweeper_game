class Tile < ApplicationRecord
  belongs_to :game

  def check
    mines = self.game.mines.all.select(:x , :y)
    mine_grid = Array.new
    mines.each do |m|
      mine_grid << {:x=>m.x,:y=>m.y}
    end
    if ismine
      mines = self.game.mines.all.select(:x , :y)
      self.game.status='failed'
      self.game.save
      mine_grid = Array.new
      mines.each do |m|
        mine_grid << {:x=>m.x,:y=>m.y}
      end
      return {:status=>0,:mines => mine_grid}
    end
    tile = self.game.tiles.find_by_x_and_y(x,y)
    if tile.cleared
      return { :status =>1}
    else
      return {:status =>2, :tiles => tile.search}
    end
  end

  def search
    if(y > 0 && y <= 6 && x > 0 && x <= 12 && self.cleared != true && flagged != true &&  self.ismine !=true)
      count = self.check_around
      self.cleared = true
      self.count_touching_mine = count
      self.save
      others = Array.new
      if count == 0
        tile = self.game.tiles.find_by_x_and_y(x-1,y-1)
        others << tile.search if tile
        tile = self.game.tiles.find_by_x_and_y(x-1,y)
        others << tile.search if tile
        tile = self.game.tiles.find_by_x_and_y(x-1,+1)
        others << tile.search if tile
        tile = self.game.tiles.find_by_x_and_y(x,y-1)
        others << tile.search if tile
        tile = self.game.tiles.find_by_x_and_y(x,y+1)
        others << tile.search if tile
        tile = self.game.tiles.find_by_x_and_y(x+1,y-1)
        others << tile.search if tile
        tile = self.game.tiles.find_by_x_and_y(x+1,y)
        others << tile.search if tile
        tile = self.game.tiles.find_by_x_and_y(x+1,y+1)
        others << tile.search if tile
      end
      return others.flatten.compact << {:count => count, :x => x, :y => y}
    end
    return []
  end

  def check_around
    count = 0
    if y > 1 && x > 1
      mine = self.game.mines.find_by_x_and_y(x-1,y-1)
      count = count+1 if mine
    end
    if y > 1
      mine = self.game.mines.find_by_x_and_y(x,y-1)
      count = count+1 if mine
    end
    if y > 1 && x < 12
      mine = self.game.mines.find_by_x_and_y(x+1,y-1)
      count = count+1 if mine
    end
    if x > 1
      mine = self.game.mines.find_by_x_and_y(x-1,y)
      count = count+1 if mine
    end
    if x < 12
      mine = self.game.mines.find_by_x_and_y(x+1,y)
      count = count+1 if mine
    end
    if y < 6 && x > 1
      mine = self.game.mines.find_by_x_and_y(x-1,y+1)
      count = count+1 if mine
    end
    if y < 6
      mine = self.game.mines.find_by_x_and_y(x,y+1)
      count = count+1 if mine
    end
    if y < 6 && x < 12
      mine = self.game.mines.find_by_x_and_y(x+1,y+1)
      count = count+1 if mine
    end
    return count
  end

  def ismine
    !!mine = self.game.mines.find_by_x_and_y(x,y)
  end

end
