class Purchase < ApplicationRecord
  has_many :products_purchases
  has_many :products, through: :products_purchases, dependent: :destroy
  has_many :returns
  validates :products, presence: true

  def total
    products.sum(:price)
  end 
end
