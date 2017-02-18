class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(permitted_params)

    if @category.save
      redirect_to categories_path
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
    params.require(:category).permit(
      :name
    )
  end
end
