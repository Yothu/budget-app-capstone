class GroupDeal < ActiveRecord::Base
  belongs_to :group, class_name: 'Group'
  belongs_to :deal, class_name: 'Deal'
end
