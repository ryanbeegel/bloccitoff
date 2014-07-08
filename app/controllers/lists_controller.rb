class ListsController < ApplicationController
  def index
    if current_user
      @lists = current_user.lists
      #authorize @list
    else
      raise Pundit::NotAuthorizedError, "You must be logged in to view list."
    end
  end

  def new
    if current_user
      @list = List.new
      #authorize @list
    else
      raise Pundit::NotAuthorizedError, "You must be logged in to create a new list."
    end
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

  def update
    @list = List.find(params[:id])
    #authorize @list

    if @list.update
      redirect_to @list, notice: "List was successfully edited."
    else
      flash[:error] = "Error editing list. Please try again."
      render :edit
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
