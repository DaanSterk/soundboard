class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
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

  def board_params
    params.require(:board).permit(:name)
  end
end
