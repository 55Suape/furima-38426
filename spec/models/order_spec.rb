require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do   
    context '内容に問題ない場合' do
      it "全ての項目に値があれば保存ができる" do
        expect(@order).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空では登録できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが「半角数字」でなければ登録できない' do
        @order.phone_number = '０９０００００００００'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberが「全角文字」では登録できない' do
        @order.phone_number = 'あああいいいいうううう'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @order.user = nil
        binding.pry
        @order.valid?
        expect(@order.errors.full_messages).to include('User must exist')
      end
      it 'itemが紐付いていないと保存できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
