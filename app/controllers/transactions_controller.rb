class TransactionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @transaction = current_user.transactions.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
