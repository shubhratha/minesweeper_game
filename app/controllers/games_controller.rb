class GamesController < ApplicationController


    def index
       @game = Game.new;
     end

     def show
       @game=Game.find_by_id(params[:id]);
       @userrank = Game.where('status = ?', 'success').select(:username, :time_taken, :sweep_count).order(:time_taken , :sweep_count );
      
     end

     def new
       @game = Game.new
     end

     def create
       @game = Game.new(params[:game])
       if @game.save

      end
    end

     def update
       @game=Game.find_by_id(params[:id])
        @game.username = params[:game][:username]  if params[:game][:username]
        @game.time_taken = params[:game][:time_taken] if params[:game][:username]
        @game.save
        @userrank = Game.where('status = ?', 'success').select(:username, :time_taken, :sweep_count).order(:time_taken , :sweep_count );
        render('update')
     end

     def gridcreate
         x=12;
         y=6;
         @game=Game.new
         @game.save
         (1..x).each do |i|
           (1..y).each do |j|
             @game.tiles.create({:x=>i, :y=>j})
           end
         end
         mines_tmp = Array.new
         count = 1
         while count <= 10
           tmp = {:x => 1+rand(12), :y => 1+rand(6)}
           if !mines_tmp.include?(tmp)
             @game.mines.create(tmp)
             mines_tmp << tmp
             count = count + 1
           end
           logger.error("ssssss#{mines_tmp}.inspect")
         end
         render('games/gridboard')
    end


end
