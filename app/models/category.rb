class Category < ApplicationRecord
  validates :category, presence: true

  belongs_to :user
  has_many :items
  has_many :buy_items
  has_many :sell_items
end
