class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new 
  end

  def show
  end

  def edit
  end

  def create
    @list = List.new
    if @list.save
      redirect_to @list, notice: "List was saved successfully."
    else
      flash[:error] = "Error creating new list. Please try again."
      render :new
    end
  end
end
