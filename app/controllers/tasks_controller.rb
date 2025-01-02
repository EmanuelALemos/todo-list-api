class TasksController < ApplicationController
  before_action :set_column
  before_action :set_task, only: %i[show edit update destroy move]

  # GET /columns/:column_id/tasks
  def index
    @tasks = @column.tasks
    render json: @tasks, status: :ok
  end

  # GET /columns/:column_id/tasks/:id
  def show
    render json: @task, status: :ok
  end

  # GET /columns/:column_id/tasks/new
  def new
    @task = @column.tasks.build
  end

  # POST /columns/:column_id/tasks
  def create
    @task = @column.tasks.build(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # GET /columns/:column_id/tasks/:id/edit
  def edit
  end

  # PATCH/PUT /columns/:column_id/tasks/:id
  def update
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /columns/:column_id/tasks/:id/move
  def move
    new_column = Column.find_by(id: params[:new_column_id])

    if new_column.nil?
      render json: { message: 'New column not found' }, status: :not_found
    elsif @task.nil?
      render json: { message: 'Task not found in this column' }, status: :not_found
    else
      # Tenta mover a tarefa para a nova coluna
      if @task.update(column_id: new_column.id)
        render json: @task, status: :ok
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /columns/:column_id/tasks/:id
  def destroy
    @task.destroy
    render json: { message: 'Task was successfully destroyed' }, status: :ok
  end

  private

  def set_column
    @column = Column.find(params[:column_id])
  end

  def set_task
    @task = @column.tasks.find_by(id: params[:id])
    if @task.nil?
      render json: { message: 'Task not found in this column' }, status: :not_found and return
    end
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority)
  end
end
