class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_many  :companies, through: :orders
    
   has_many :order_companies, through: :orders, source: :company
    
    validates :email, presence: true, uniqueness: true 
   
    validates :username, presence: true
    
    
    
end

