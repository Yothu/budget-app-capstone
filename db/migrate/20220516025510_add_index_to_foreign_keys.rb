class AddIndexToForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_index :deals, :author_id

    add_index :groups, :deal_id
    add_index :groups, :author_id
  end
end
