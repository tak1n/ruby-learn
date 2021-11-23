class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :delete]

  def index
    @todos = Todo.all

    render json: @todos
  end

  def show
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo
    else
      render json: { "error_messages" => @todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: { "error_messages" => @todo.errors }, status: :unprocessable_entity
    end
  end

  def delete
    @todo.destroy

    head :no_content
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:id, :title, :completed)
  end
end
