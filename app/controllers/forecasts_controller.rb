class ForecastsController < ApplicationController
  before_action :get_dates

  def index
    cassandra = Cassandra.new(current_user, permitted_params)
    @predictions = Kaminari.paginate_array(cassandra.predict).page(params[:page])
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
      params[:start_date] = current_user.transactions.order(:created_at).first.created_at.strftime('%d %B, %Y')
      params[:end_date] = Date.today.end_of_month.strftime('%d %B, %Y')
    end
  end
end
