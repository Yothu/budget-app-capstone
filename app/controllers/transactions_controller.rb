class TransactionsController < ApplicationController
  def index
    @category = Group.find(params[:category_id])
    @group_deals = GroupDeal.includes(:deal).where(group_id: params[:category_id]).order(created_at: :desc)
  end

  def new
    @category = Group.find(params[:category_id])
    @categories = current_user.groups
  end

  def create
    if at_least_one_check_box
      deal = current_user.deals.new(name: params[:name], amount: params[:amount])

      if deal.save
        selected_categories_ids.each do |sc|
          group_deal = GroupDeal.new(deal_id: deal.id, group_id: sc)
          unless group_deal.save
            reload_page
            flash[:error] = 'A transaction was not created!'
          end
        end
        redirect_to category_transactions_path(category_id: params[:category_id])
        flash[:succes] = 'Transaction created successfully!'
      else
        reload_page
        flash[:error] = 'Transaction was not created!'
      end
    else
      reload_page
      flash[:error] = 'Select at least one category!'
    end
  end

  private

  def at_least_one_check_box
    return false if selected_categories_ids.length.zero?

    true
  end

  def selected_categories_ids
    params[:groups]
  end

  def reload_page
    redirect_to new_category_transaction_path(category_id: params[:category_id])
  end
end
