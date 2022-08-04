class Return < ApplicationRecord
  belongs_to :purchase
  belongs_to :product

  before_save :return_product

  def return_product
    product_join = purchase.products_purchases.find_by(product_id: product.id)
    product_join.destroy
  end
end

