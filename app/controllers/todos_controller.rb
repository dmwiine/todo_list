class TodosController < ApplicationController

  # GET /todos
  def index
    @todos = Todo.all
    json_response @todos
  end

  def create
    @todo = Todo.create(todo_params)
    json_response @todo, :created
  end

  def show
    
  end
  private

  def todo_params
    params.require(:todo).permit(:title, :user_id)
  end
end
