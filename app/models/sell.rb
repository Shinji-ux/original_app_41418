class Sell < ApplicationRecord
  validates :transaction_date, presence: true
  validates :total_price, presence: true

  belongs_to :user
  belongs_to :customer
  has_many :sell_items, inverse_of: :sell, dependent: :destroy
  has_many :sells, through: :sell_items

  accepts_nested_attributes_for :sell_items, allow_destroy: true
end
