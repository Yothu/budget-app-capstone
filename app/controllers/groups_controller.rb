class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
    @current_user = current_user
  end

  def new
    @group = Group.new
  end

  def create
    new_group = current_user.groups.new(group_params)

    if new_group.save
      redirect_to user_path
      flash[:success] = 'Category was created!'
    else
      redirect_to new_group_path
      flash[:error] = 'Category was not created!'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
