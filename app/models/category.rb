require 'csv'

class Category < ApplicationRecord
  validates :category, presence: true

  belongs_to :user
  has_many :items
  has_many :buy_items
  has_many :sell_items

  def self.import_from_csv(file, current_user)
    CSV.foreach(file.path, headers: true) do |row|
      category_attributes = row.to_hash
      cleaned_attributes = category_attributes.transform_keys { |key| key.strip.gsub("\uFEFF", '') }
  
      user = current_user
      if user
        cleaned_attributes["user_id"] = user.id
      end
  
      cleaned_attributes.delete("user_name")
      cleaned_attributes.delete("user_email")
      cleaned_attributes.delete_if { |key, value| key.blank? }
  
      Category.create!(cleaned_attributes)
    end
  end
end
