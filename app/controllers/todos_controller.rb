class TodosController < ApplicationController
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo was saved sucessfully!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
    if Todo.update(todo_params)
      flash[:notice] = "Todo has been succesfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  private
  
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
  
end
