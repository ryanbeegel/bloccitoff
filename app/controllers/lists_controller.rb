class ListsController < ApplicationController
  def index
    @lists = current_user.lists
    #authorize @list
  end

  def new
    @list = List.new
    #authorize @list
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
    #authorize @list
  end

  def edit
    @list = List.find(params[:id])
    #authorize @list
  end

  def create
    @list = List.new(params.require(:list).permit(:title))
    @list = current_user.lists.build(params.require(:list).permit(:title))
    #authorize @list
    if @list.save
      redirect_to @list, notice: "List was saved successfully."
    else
      flash[:error] = "Error creating new list. Please try again."
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])

    #authorize @list
    if @list.destroy
      flash[:notice] = "Your list was deleted successfully."
      redirect_to lists_path
    else
      flash[:error] = "There was an error deleting the list."
      render :show
    end
  end
end
