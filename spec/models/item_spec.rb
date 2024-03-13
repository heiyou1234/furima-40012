require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品機能' do
    context '出品できる場合' do
  it 'すべてを入力すれば保存できる' do
    expect(@item).to be_valid
  end
end
end
context '出品できない場合' do
  it 'imageが空では保存できない' do
    @item.image=nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it '商品名が空では保存できない' do
    @item.item_name=''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end
  it '商品説明が空では保存できない' do
    @item.explanation=''
    @item.valid?
    expect(@item.errors.full_messages).to include("Explanation can't be blank")
  end
  it 'カテゴリーが空では保存できない' do
    @item.category_id=nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it '商品状態が空では保存できない' do
    @item.condition_id=nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  it '配送料の負担が空では保存できない' do
    @item.delivery_id=nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery can't be blank")
  end
  it '発送元の地域が空では保存できない' do
    @item.prefecture_id=nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end
  it '発送までの日数が空では保存できない' do
    @item.number_of_day_id=nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Number of day can't be blank")
  end
  it '価格が空では保存できない' do
    @item.price=""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it 'priceが300以下では保存できない' do
    @item.price=150
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end
  it 'priceが9,999,999以上では保存できない' do
    @item.price=10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end
  
end
end
