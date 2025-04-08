class EntriesController < ApplicationController
  before_action :set_entry, only: [ :show, :index ]

  def index
    @entries = Entry.all
    @entries.each do |entry|
      entry.start_time = entry.created_at if entry.respond_to?(:start_time=)
    end
    # @entry is set by the `set_entry` callback if `params[:id]` is present
  end

  def show
    # @entry is set by the `set_entry` callback
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

  def set_entry
    @entry = Entry.find(params[:id]) if params[:id].present?
  end

  def entry_params
    params.require(:entry).permit(:name, :link)
  end
end
