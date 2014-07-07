class TodosController < ApplicationController
  before_action :find_list 

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
    @todo = @list.todos.build(params.require(:todo).permit(:body))

    if @todo.save
      redirect_to @list, notice: "To-do list item was successfully saved."
    else
      flash[:error] = "Error creating to-do list item. Please try again."
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @todo = Todo.find(params[:id])

    #authorize @post
    if @todo.destroy
      flash[:notice] = "Congratulations! You have completed this todo!"
      redirect_to @list
    else
      flash[:error] = "There was an error."
      render :show
    end
  end

  private 

  def find_list
    @list = List.find(params[:list_id])
  end
end
