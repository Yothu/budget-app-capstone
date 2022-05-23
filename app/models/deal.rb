class Deal < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :group_deals, foreign_key: 'deal_id', class_name: 'GroupDeal', dependent: :delete_all

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
