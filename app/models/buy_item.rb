class BuyItem < ApplicationRecord
  validates :quantity, presence: true
  validates :item_price, presence: true

  before_validation :set_category

  belongs_to :buy
  belongs_to :item
  belongs_to :category

  def set_category
    self.category = item.category
  end
end
