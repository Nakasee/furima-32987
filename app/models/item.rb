class Item < ApplicationRecord
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :judgment
  belongs_to_active_hash :cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 999_999_999 }
    validates :description

      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :judgment_id
        validates :cost_id
        validates :prefecture_id
        validates :day_id
    end
  end
end
