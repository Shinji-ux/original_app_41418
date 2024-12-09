class SellItem < ApplicationRecord
  validates :quantity, presence: true
  validates :item_price, presence: true
  validates :item_total_price, presence: true


  belongs_to :sell
  belongs_to :item
  belongs_to :category
end
