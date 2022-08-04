class Role < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :role, presence: true
end 