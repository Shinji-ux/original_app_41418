class Customer < ApplicationRecord
  validates :company, presence: true
  validates :phone, format: { with: /\A0\d{9,10}\z/, message: "must be a valid phone number" }

  belongs_to :user
  has_many :sells, dependent: :destroy
end
