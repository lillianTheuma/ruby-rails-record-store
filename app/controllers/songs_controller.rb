class SongsController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    @song = @album.songs.new
    render :new
  end
  def show
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    render :show
  end
  def edit
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    render :edit
  end
  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to album_path(@song.album)
    else
      render :edit
    end
  end
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to album_path(@song.album)
  end
end
