class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to new_category_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:category)
  end
end
