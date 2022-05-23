class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_deals, foreign_key: 'deal_id', class_name: 'GroupDeal', dependent: :delete_all

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  def date
    "#{created_at.day}/#{created_at.month}/#{created_at.year}"
  end

  def total
    "$#{amount}"
  end
end
