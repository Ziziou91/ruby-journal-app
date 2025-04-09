class EntriesController < ApplicationController
  before_action :set_entry, only: [ :show, :edit, :update, :destroy, :share ]

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
    @users = User.where.not(id: current_user.id)
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

  def share
    user = User.find(params[:user_id]) # Find the user to share with
    if user
      # Create a new record in the shared_entries table
      SharedEntry.create(user_id: user.id, entry_id: @entry.id)
      flash[:notice] = "Entry successfully shared with #{user.email}."
    else
      flash[:alert] = "Failed to share the entry."
    end
    redirect_to edit_entry_path(@entry)
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:name, :link, shared_user_ids: [])
  end
end
