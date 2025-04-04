class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    @entry = nil # Clear @entry when not on the show page
  end

  def show
    @entry = Entry.find(params[:id]) # Set @entry only for the show action
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    Entry.find(params[:id]).destroy
    redirect_to root_url
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to @entry, notice: "Entry successfully updated."
    else
      render :edit
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :link)
  end
end
