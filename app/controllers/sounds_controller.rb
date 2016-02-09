class SoundsController < ApplicationController
  def new
    Rails.cache.write("board", params[:board])
    Rails.cache.write("xPos", params[:xPos])
    Rails.cache.write("yPos", params[:yPos])
    @sound = Sound.new
  end

  def create
    @board = Board.find(Rails.cache.read("board"))
    @board.sounds.create(sound_params) # How to fix????
    if @board.save!
      return redirect_to board_path(Rails.cache.read("board"))
    end
  end

  def sound_params
    params.require(:sound).permit(:name, :sound)
  end
end
