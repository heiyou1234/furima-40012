class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :street, :building, :phone_number,:price, :user_id, :item_id, :token
  validates :postcode, presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, presence: true, format: {with:  /\A\d{10}$|^\d{11}\z/, message: "is invalid. Include hyphen(-)"}
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(purchase_id: @purchase.id, postcode: postcode, 
                  prefecture_id: prefecture_id, city: city, street: street,
                  building: building, phone_number: phone_number)
  end
end
