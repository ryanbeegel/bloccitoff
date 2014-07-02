class TodosController < ApplicationController
  def index
    @todos = Todos.all
  end

  def new
  end

  def edit
  end
end
