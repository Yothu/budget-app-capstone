class Group < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :group_deals, foreign_key: 'group_id', class_name: 'GroupDeal', dependent: :delete_all

  validates :name, presence: true
  validates :icon, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }

  def date
    "#{created_at.day} #{created_at.month} #{created_at.year}"
  end

  def total
    "$#{total_amount}"
  end
end
