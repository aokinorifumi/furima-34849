require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規投稿' do
    context '新規投稿できるとき' do
      it '全ての情報が入力されている時' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '商品画像を1枚つけることが必須であること(画像がないと投稿出来ない)' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること(商品名がないと登録出来ない)' do
        @item.name =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること(商品の説明がないと登録出来ない)' do
        @item.text =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーが必須であること(カテゴリーがないと登録出来ない)' do
        @item.category_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報が必須であること(商品の状態についての情報がないと登録出来ない)' do
        @item.status_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担についての情報が必須であること(配送料の負担についての情報がないと登録出来ない)' do
        @item.burden_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it '発送元の地域についての情報が必須であること(発送元の地域についての情報がないと登録出来ない)' do
        @item.prefecture_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数についての情報が必須であること(発送までの日数についての情報がないと登録出来ない)' do
        @item.delivery_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end

      it '販売価格についての情報が必須であること(販売価格についての情報がないと登録出来ない)' do
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること(¥299以下の場合登録出来ない)' do
        @item.price ='299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること(¥10,000,000以上の場合登録出来ない)' do
        @item.price ='10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '販売価格は半角数字のみ保存可能であること(全角数字では登録出来ない)' do
        @item.price ='３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格は半角数字のみ保存可能であること(半角カナでは登録出来ない)' do
        @item.price ='ﾆｾﾝ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      

      
    end
  end
end
