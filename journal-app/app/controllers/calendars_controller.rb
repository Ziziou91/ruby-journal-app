class CalendarsController < ApplicationController
    def show
      # Parse the month parameter or default to the current month
      @date = params[:month].present? ? Date.parse(params[:month]) : Date.today.beginning_of_month

      # Fetch events for the specified month
      @events = YourEventModel.where(start_time: @date.beginning_of_month..@date.end_of_month)

      # Render the calendar partial

      render partial: "shared/calendar", locals: { start_date: @date, events: @events }
    end
end
