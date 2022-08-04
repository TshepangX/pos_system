class CreateProductsPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :products_purchases do |t|
      t.references :product, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
