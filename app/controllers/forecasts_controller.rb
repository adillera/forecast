class ForecastsController < ApplicationController
  before_action :get_dates

  def index
    cassandra = Cassandra.new(current_user, permitted_params)
    @forecast = cassandra.predict
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  private
  def permitted_params
    params.permit(
      :start_date,
      :end_date
    )
  end

  def get_dates
    if params[:start_date].blank? || params[:end_date].blank?
      params[:start_date] = Date.today.beginning_of_month.strftime('%d %B, %Y')
      params[:end_date] = Date.today.end_of_month.strftime('%d %B, %Y')
    end
  end
end
