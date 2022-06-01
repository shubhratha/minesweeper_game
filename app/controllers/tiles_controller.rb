class TilesController < ApplicationController
 before_action :find_game

  def sweeptile
    @tile = @game.tiles.find_by_x_and_y(params[:x], params[:y])
    @game.sweep_count+= 1
    @game.save
    res=@tile.check
    if res[:status] == 2
      tiles=res[:tiles]
    end
    respond_to do |format|
      format.json { render :json => res}
    end
  end

  def flagged_tile
    @tile = @game.tiles.find_by_x_and_y(params[:x], params[:y])
    flag=params[:flag]
    @tile.flagged = flag
    @tile.save
    mine = @tile.game.mines.find_by_x_and_y(params[:x], params[:y])
    if mine && (flag == "true")
      @game.flagged_mine+= 1
      @game.save
    elsif mine && (flag == "false")
      @game.flagged_mine-= 1
      @game.save
    end
    if @game.flagged_mine == 10
      @game.status="success"
      @game.save
      respond_to do |format|
        format.json { render :json => {:status => "success"}}
    end
    else
      respond_to do |format|
        format.json { render :json => {:status => "fail"}}
      end
    end
  end

  private
  def find_game
    @game = Game.find(params[:game_id])
  end
end
