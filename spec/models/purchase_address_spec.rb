require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: @item.id)
  end
  describe '購入情報の保存' do
    context '内容に問題ない場合' do
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@purchase_address).to be_valid
  end
  it 'buildingは空でも保存できること' do
    @purchase_address.building = ''
    expect(@purchase_address).to be_valid
  end
end

context '内容に問題がある場合' do
  it 'postcodeが空だと保存できないこと' do
    @purchase_address.postcode = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
  end
  it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @purchase_address.postcode = '1234567'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Postcode is invalid")
  end
  it '発送元の地域が空では保存できない' do
    @purchase_address.prefecture_id=nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
  end
  it '発送元の地域が[---]では保存できない' do
    @purchase_address.prefecture_id=0
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
  end
  it 'userが紐付いていないと保存できないこと' do
    @purchase_address.user_id = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("User can't be blank")
  end
  it 'cityが空だと保存できないこと' do
    @purchase_address.city = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("City can't be blank")
  end
  it 'streetが空だと保存できないこと' do
    @purchase_address.street = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
  end
  it 'phone_numberが空だと保存できないこと' do
    @purchase_address.phone_number = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
  end
  it 'phone_numberが10桁未満だと保存できない' do
    @purchase_address.phone_number = '999999999'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
  end
  it 'phone_numberが12桁以上だと保存できない' do
    @purchase_address.phone_number = '123-4567-9098'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
  end
  it 'tokenが空だと保存できないこと' do
    @purchase_address.token = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
  end
end
end
end
