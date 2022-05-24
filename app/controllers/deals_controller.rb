class DealsController < ApplicationController
  load_and_authorize_resource

  def index
    @group = Group.find(params[:group_id])
    @group_deals = GroupDeal.includes(:deal).where(group_id: params[:group_id]).order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

  def create
    if at_least_one_check_box
      deal = current_user.deals.new(name: params[:name], amount: params[:amount])

      if deal.save
        selected_groups_ids.each do |sc|
          group_deal = GroupDeal.new(deal_id: deal.id, group_id: sc)
          unless group_deal.save
            reload_page
            flash[:error] = 'A transaction was not created!'
          end
        end
        redirect_to group_deals_path(group_id: params[:group_id])
        flash[:success] = 'Transaction created successfully!'
      else
        reload_page
        flash[:error] = 'Add Name and Amount!'
      end
    else
      reload_page
      flash[:error] = 'Select at least one category!'
    end
  end

  private

  def at_least_one_check_box
    return false if selected_groups_ids.nil?

    true
  end

  def selected_groups_ids
    params[:groups]
  end

  def reload_page
    redirect_to new_group_deal_path(group_id: params[:group_id])
  end
end
