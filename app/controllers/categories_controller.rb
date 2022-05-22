class CategoriesController < ApplicationController
  def index
    @current_user = current_user
  end

  def new
    @group = Group.new
  end

  def create
    new_category = current_user.groups.new(category_params)

    if new_category.save
      redirect_to authenticated_user_root_path
      flash[:success] = 'Category was created!'
    else
      redirect_to new_category_path
      flash[:error] = 'Category was not created!'
    end
  end

  private

  def category_params
    params.require(:group).permit(:name, :icon)
  end
end
