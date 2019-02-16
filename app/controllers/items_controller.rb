class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_item, only: [:show, :update, :destroy] 
  
  def index
    @items = @todo.items
    json_response @items
  end

    # POST /todos
  def create
    @item = Item.create!(item_params)
    json_response @item, :created
  end

    # GET /todos/:id
  def show
    json_response @item
  end

    # PUT /todos/:id
  def update
    @item.update(item_params)
    head :no_content
  end

    # DELETE /todos/:id
  def destroy
    @item.destroy
    head :no_content
  end
  private

  def item_params
    params.permit(:title, :description, :todo_id, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_item
    @item = @todo.items.find_by(id: params[:id]) if @todo
  end
end
