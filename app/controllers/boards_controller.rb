class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @sounds = @board.sounds
    @rows = 8 # Should be board table field
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create(board_params)
    if @board.save
      flash[:success] = "Board created!"
      return redirect_to action: 'index'
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])

    if @board.update_attributes(board_params)
      flash[:success] = "Board updated!"
      return redirect_to action: 'index'
    end
  end

  def destroy
    @board = Board.find(params[:id])
    if @board.destroy
      flash[:success] = "Board deleted!"
    end
    return redirect_to action: 'index'
  end

  def toggle
    @board = Board.find(params[:id])
    if @board.isInEditMode
      @board.isInEditMode = false
    else
      @board.isInEditMode = true
    end
    @board.save
    return redirect_to action: 'show'
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
