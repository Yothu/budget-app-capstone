class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :icon
      t.integer :author_id, null: false
      t.integer :deal_id, null: false

      t.timestamps
    end
  end
end
