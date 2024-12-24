require 'csv'

class Supplier < ApplicationRecord
  validates :company, presence: true
  validates :phone, presence: true, format: { with: /\A0\d{9,10}\z/, message: "must be a valid phone number" }

  belongs_to :user
  has_many :buys, dependent: :destroy

  def self.import_from_csv(file, current_user)
    CSV.foreach(file.path, headers: true) do |row|
      supplier_attributes = row.to_hash
      cleaned_attributes = supplier_attributes.transform_keys { |key| key.strip.gsub("\uFEFF", '') }
  
      user = current_user
      if user
        cleaned_attributes["user_id"] = user.id
      end
  
      cleaned_attributes.delete("user_name")
      cleaned_attributes.delete("user_email")
      cleaned_attributes.delete_if { |key, value| key.blank? }
  
      Supplier.create!(cleaned_attributes)
    end
  end
end
