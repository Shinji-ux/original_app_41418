class BuyItem < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :buy
  belongs_to :item
  belongs_to :category
end
