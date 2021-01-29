class ItemBuyer
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :city, :address
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    with_options format: { with: /\A\d{3}-\d{4}\z/ } do
      validates :post_code, length: { is: 8 }
    end
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                 building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
