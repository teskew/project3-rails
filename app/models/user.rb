class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_many  :companies, through: :orders
    
   has_many :order_companies, through: :orders, source: :company
    validates :email, uniqueness: true,  presence: true 
    validates :username, presence: true 
    validates :password, presence: true 
    # accepts_nested_attributes_for :companies
    
    
end

