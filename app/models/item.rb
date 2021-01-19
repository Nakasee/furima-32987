class Item < ApplicationRecord
  
  belongs_to :user
  belongs_to :category
  belongs_to :judgment
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :day
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ },numericality: { greater_than: 299, less_than: 9_999_999 }
    validates :discription

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :judgment_id
      validates :cost_id
      validates :prefecture_id
      validates :day_id
    end
  
  end
end
