class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.string :name
      t.decimal :amount, null: false, default: 0
      t.integer :author_id

      t.timestamps
    end
  end
end
