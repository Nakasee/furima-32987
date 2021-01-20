require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品登録機能' do
    it '商品画像を１枚つける事が必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が必須だと言うこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態についての情報が必須である事' do
      @item.judgment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Judgment must be other than 1')
    end
    it '配送料の負担についての情報が必須である事' do
      @item.cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Cost must be other than 1')
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '発送までの日数についての情報が必須であること' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 1')
    end
    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が¥300以下では保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が¥9999999以上では保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格は半角数字のみ保存可能である事' do
      @item.price = '１２３４５６'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
