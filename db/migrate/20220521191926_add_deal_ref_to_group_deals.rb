class AddDealRefToGroupDeals < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :group_deals, :deals, column: :deal_id, on_delete: :cascade
  end
end
