class ColumnsController < ApplicationController
  before_action :set_board
  before_action :set_column, only: %i[show edit update destroy]

  # GET /boards/:board_id/columns
  def index
    @columns = @board.columns

    if @columns.empty?
      render json: { message: 'No columns found for this board' }, status: :not_found
    else
      render json: @columns, status: :ok
    end
  end

  # GET /boards/:board_id/columns/:id
  def show
    render json: @column, status: :ok
  end

  # GET /boards/:board_id/columns/new
  def new
    @column = @board.columns.build
  end

  # POST /boards/:board_id/columns
  def create
    @column = @board.columns.build(column_params)

    if @column.save
      render json: @column, status: :created
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  # GET /boards/:board_id/columns/:id/edit
  def edit
  end

  # PATCH/PUT /boards/:board_id/columns/:id
  def update
    if @column.update(column_params)
      render json: @column, status: :ok
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/:board_id/columns/:id
  def destroy
    @column.destroy
    render json: { message: 'Column was successfully destroyed' }, status: :ok
  end

  private

  def set_board
    @board = Board.find_by(id: params[:board_id])
    if @board.nil?
      render json: { message: 'No board found with the given ID' }, status: :not_found
    end
  end

  def set_column
    @column = @board.columns.find_by(id: params[:id])
    if @column.nil?
      render json: { message: 'No column found with the given ID' }, status: :not_found
    end
  end

  def column_params
    params.require(:column).permit(:title, :description, :color)
  end
end
