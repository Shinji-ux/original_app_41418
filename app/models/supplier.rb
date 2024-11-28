class Supplier < ApplicationRecord
  validates :company, presence: true

  belongs_to :user
  has_many :buys
end
