class Group < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :group_deals, foreign_key: 'group_id', class_name: 'GroupDeal', dependent: :delete_all

  validates :name, presence: true
  validates :icon, presence: true
end
