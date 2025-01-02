class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  # GET /boards
  def index
    @boards = Board.all

    if @boards.empty?
      render json: { message: 'No boards found' }, status: :not_found
    else
      render json: @boards, status: :ok
    end
  end

  # GET /boards/:id
  def show
    render json: @board, status: :ok
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # POST /boards
  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board, status: :created
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # GET /boards/:id/edit
  def edit
  end

  # PATCH/PUT /boards/:id
  def update
    if @board.update(board_params)
      render json: @board, status: :ok
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/:id
  def destroy
    @board.destroy
    render json: { message: 'Board was successfully destroyed' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Board not found' }, status: :not_found
  end

  private

  def set_board
    @board = Board.find_by(id: params[:id])

    unless @board
      render json: { message: 'Board not found' }, status: :not_found
    end
  end

  def board_params
    params.require(:board).permit(:title, :description)
  end
end
