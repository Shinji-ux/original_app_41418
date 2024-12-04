require 'csv'

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

  def self.import_items_from_csv(file, current_user)
    CSV.foreach(file.path, headers: true) do |row|
      item_attributes = row.to_hash
      cleaned_attributes = item_attributes.transform_keys { |key| key.strip.gsub("\uFEFF", '') }
  
      user = current_user
      if user
        cleaned_attributes["user_id"] = user.id
      end
  
      # カテゴリ名からカテゴリIDを取得する例 (カテゴリIDをCSVに含める場合は不要)
      if cleaned_attributes["category_name"]
        category = Category.find_by(name: cleaned_attributes["category_name"])
        if category
          cleaned_attributes["category_id"] = category.id
        else
          cleaned_attributes.delete("category_name")
          next # カテゴリが見つからない場合、この行をスキップ
        end
      end
  
      # 不要な属性を削除
      cleaned_attributes.delete("category_name")
  
      cleaned_attributes.delete_if { |key, value| key.blank? }
  
      Item.create!(cleaned_attributes)
    end
  end
end
