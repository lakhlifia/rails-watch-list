class ListsController < ApplicationController
   # Action to show all lists

   def index
    @lists = List.all
  end


  # Action to show the details of a specific list
  def show
    @list = List.find(params[:id])
  end
   # Action to render the form for creating a new list
   def new
    @list = List.new
  end
  # Action to handle the creation of a new list
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to  list_path(@list), notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Strong parameters for creating a new list
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
