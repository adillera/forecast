class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.page(params[:page])
  end

  def show
  end

  def new
    @categories = current_user.categories
    @transaction = current_user.transactions.new
  end

  def create
    @transaction = current_user.transactions.new(permitted_params)

    if @transaction.save
      redirect_to transactions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def permitted_params
    params[:transaction] = params[:transaction].reject{ |k, v| v.blank? }
    params[:transaction][:amount] = BigDecimal.new(params[:transaction][:amount].to_s)

    params.require(:transaction).permit(
      :flow,
      :item,
      :amount,
      :repeat,
      :single_occurrence,
      :category_id
    )
  end
end
