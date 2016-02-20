class SoundsController < ApplicationController
  def new
    Rails.cache.write("board", params[:board])
    Rails.cache.write("xPos", params[:xPos])
    Rails.cache.write("yPos", params[:yPos])
    @sound = Sound.new
  end

  def create
    @board = Board.find(Rails.cache.read("board"))
    @model = @board.sounds.create(sound_params)
    @model.xPos = Rails.cache.read("xPos")
    @model.yPos = Rails.cache.read("yPos")
    @model.save
    if @board.save!
      return redirect_to board_path(Rails.cache.read("board"))
    end
  end

  def edit
    Rails.cache.write("board", params[:board])
    Rails.cache.write("xPos", params[:xPos])
    Rails.cache.write("yPos", params[:yPos])
    @sound = Sound.find(params[:id])
  end

  def update
    @sound = Sound.find(params[:id])
    @sound.update_attributes(sound_params)
    @sound.xPos = Rails.cache.read("xPos")
    @sound.yPos = Rails.cache.read("yPos")
    if @sound.save
      return redirect_to board_path(Rails.cache.read("board"))
    end
  end

  def sound_params
    params.require(:sound).permit(:name, :sound)
  end
end
