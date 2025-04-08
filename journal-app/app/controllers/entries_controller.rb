class EntriesController < ApplicationController
  before_action :set_entry, only: [ :show, :edit, :update, :destroy ]

  def index
    @entries = Entry.left_joins(:shared_entries)
                    .where(user: current_user)
                    .or(Entry.where(shared_entries: { user_id: current_user.id }))
                    .distinct

    if params[:filter] == "user"
      @show_entries = @entries.where(user_id: current_user.id)
    else
      @show_entries = @entries
    end
  end

  def show
    # Ensure the user has access to the entry
    unless @entry.user == current_user || @entry.shared_with_users.include?(current_user)
      redirect_to entries_path, alert: "You do not have access to this entry."
    end
  end

  def new
    @entry = current_user.entries.build
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      redirect_to @entry, notice: "Entry successfully created."
    else
      render :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    if @entry.user == current_user
      if @entry.update(entry_params)
        redirect_to @entry, notice: "Entry successfully updated."
      else
        render :edit
      end
    else
      redirect_to entries_path, alert: "You can only update your own entries."
    end
  end

  def destroy
    if @entry.user == current_user
      @entry.destroy
      redirect_to entries_path, notice: "Entry successfully deleted."
    else
      redirect_to entries_path, alert: "You can only delete your own entries."
    end
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:name, :link, shared_user_ids: [])
  end
end
