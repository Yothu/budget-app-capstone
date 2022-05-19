class AddDealRefToGroups < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :groups, :deals, column: :deal_id, on_delete: :cascade
  end
end
