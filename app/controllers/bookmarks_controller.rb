class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]

  # GET /bookmarks/new
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @list = List.find(params[:list_id]) # Charger l'objet @list
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list), notice: 'Bookmark was successfully deleted.' # Utiliser @list pour la redirection
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:movie_id, :comment)
    end
end
