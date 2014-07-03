class TodosController < ApplicationController
  def index
    @todos = @list.todos
  end

  def new
    @todo = Todo.new
  end

  def show
  end

  def edit
  end

  def create
    @todo = Todo.new
    if @todo.save
      redirect_to @todo, notice: "To-do list item was successfully saved."
    else
      flash[:error] = "Error creating to-do list item. Please try again."
      render :new
    end
  end

  private 

  def find_list
    @list = List.find(params[:list_id])
  end
end
