class User < ApplicationRecord
  enum role: {
    cashier: 0, 
    manager: 1, 
    owner: 2
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
