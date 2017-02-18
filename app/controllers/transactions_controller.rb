class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.page(params[:page])
  end

  def show
  end

  def new
    @transaction = current_user.transactions.new
    @categories = current_user.categories
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
    @transaction = current_user.transactions.find(params[:id])
    @categories = current_user.categories
  end

  def update
    transaction = current_user.transactions.find(params[:id])

    if transaction.update(permitted_params)
      redirect_to transactions_path
    else
      redirect_to edit_transaction_path(transaction)
    end
  end

  def destroy
  end

  private
  def permitted_params
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
