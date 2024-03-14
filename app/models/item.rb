class Item < ApplicationRecord
  has_one_attached :image

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :price, presence: true,
                    numericality: {only_integer:true,greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999}
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :number_of_day
  validates :number_of_day_id, numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  belongs_to :delivery
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  belongs_to :category
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}

  belongs_to :user
  #has_one :purchase
end
