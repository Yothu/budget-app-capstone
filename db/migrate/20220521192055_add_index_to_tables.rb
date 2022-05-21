class AddIndexToTables < ActiveRecord::Migration[7.0]
  def change
    add_index :groups, :author_id
    add_index :deals, :author_id

    add_index :group_deals, :group_id
    add_index :group_deals, :deal_id
  end
end
