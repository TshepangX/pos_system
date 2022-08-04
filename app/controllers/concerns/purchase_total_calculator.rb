module PurchaseTotalCalculator
  extend self
  

   def sum(purchase)
       purchase.sum(:price)
   end 
end 