class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update, :destroy]

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid? 
      @song.save
      redirect_to song_path(@song)
    else
      render 'new'
    end
  end

  def index
    @songs = Song.all
  end
  
  def show
  end

  def edit
  end

  def destroy
    @song = Song.find(params[:id])
    if @song.destroy
      # flash[:success] = 'Object was successfully deleted.'
      redirect_to songs_url
    else
      # flash[:error] = 'Something went wrong'
      redirect_to songs_url
    end
  end
  

  def update
  if @song.update(song_params)
      redirect_to song_path(@song)
  else
    render "edit"
  end
end

  private

def set_song!
  @song = Song.find(params[:id])
end

def song_params
  params.require(:song).permit(
      :title, :released, :release_year, :artist_name, :genre
      )
    end
end