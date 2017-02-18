class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.page(params[:page])
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

  def destroy
    category = Category.find(params[:id])

    category.destroy

    redirect_to categories_path
  end

  private
  def permitted_params
    params.require(:category).permit(
      :name
    )
  end
end
