class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_entry, only: [ :show, :index ]
  before_action :set_sidebar_entries

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name ])
  end

  private
  def set_entry
    @entry = Entry.find(params[:id]) if params[:id].present?
  end

  def set_sidebar_entries
    @entries = Entry.order(created_at: :desc).limit(5) # Adjust the query as needed
  end
end
