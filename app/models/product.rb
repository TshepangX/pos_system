class Product < ApplicationRecord
  has_many :products_purchases
  has_many :purchases, through: :products_purchases, dependent: :destroy
  has_many :returns

  validates :name, presence: true 

end

