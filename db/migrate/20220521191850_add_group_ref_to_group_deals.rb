class AddGroupRefToGroupDeals < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :group_deals, :groups, column: :group_id, on_delete: :cascade
  end
end
