class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :unit, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  
  belongs_to :user
  belongs_to :category
  has_many :sell_items
  has_many :sells, through: :sell_items
  has_many :buy_items
  has_many :buys, through: :buy_items
end
