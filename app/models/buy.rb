class Buy < ApplicationRecord
  validates :transaction_date, presence: true
  validates :total_price, presence: true

  belongs_to :supplier
  has_many :buy_items
  has_many :items, through: :buy_items

  accepts_nested_attributes_for :buy_items, allow_destroy: true
end
