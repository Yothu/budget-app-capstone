class TransactionsController < ApplicationController
  def index
    @category = Group.find(params[:category_id])
    @group_deals = GroupDeal.includes(:deal).where(group_id: params[:category_id]).order(created_at: :desc)
  end

  def new
    
  end
end
