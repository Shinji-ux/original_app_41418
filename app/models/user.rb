class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}\z/i
  validates_format_of :password, with: PASSWORD_REGEX, on: :create

  validates :email, presence: true, on: :create
  validates :company, presence: true
  validates :phone, presence: true, format: { with: /\A0\d{9,10}\z/, message: "must be a valid phone number" }

  has_one :profile
  has_many :categories
  has_many :items, through: :categories
  has_many :suppliers
  has_many :buys, through: :suppliers
  has_many :customers
  has_many :sells, through: :customers
end
