class GroupDeal < ApplicationRecord
  after_create :increase_category_total_amount

  belongs_to :deal, class_name: 'Deal'
  belongs_to :group, class_name: 'Group'

  private

  def increase_category_total_amount
    group.increment!(:total_amount, deal.amount)
  end
end
