class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :phone, format: { with: /\A0\d{9,10}\z/, message: "must be あ valid phone number" }

  has_one :profile
  has_many :categories
  has_many :items, through: :categories
  has_many :suppliers
  has_many :buys, through: :suppliers
  has_many :customers
  has_many :sells, through: :customers
end
