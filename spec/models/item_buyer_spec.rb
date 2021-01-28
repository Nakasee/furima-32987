require 'rails_helper'

RSpec.describe ItemBuyer, type: :model do
  before do
    @item_buyer = FactoryBot.build(:item_buyer)
  end

  describe '商品購入機能' do
    it '全ての項目が入力されていれば購入ができる' do
      expect(@item_buyer).to be_valid
    end
    it 'token(クレジットカード情報)が空だと購入ができない' do
      @item_buyer.token = nil
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと購入ができない' do
      @item_buyer.post_code = ''
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にハイフンがないと登録できない' do
      @item_buyer.post_code = '1234567'
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include('Post code is invalid')
    end
    it '郵便番号が8桁出ないと購入できない' do
      @item_buyer.post_code = '123-45678'
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include('Post code is invalid')
    end
    it 'prefecture_idが空だと購入できない' do
      @item_buyer.prefecture_id = 1
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空だと購入できない' do
      @item_buyer.city = ''
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと購入できない' do
      @item_buyer.address = ''
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @item_buyer.phone_number = ''
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが11桁でなければ購入できない' do
      @item_buyer.phone_number = '080123456789'
      @item_buyer.valid?
      expect(@item_buyer.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
