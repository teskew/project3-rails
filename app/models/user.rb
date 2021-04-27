class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_many :companies, through: :orders  
    validates :email, presence: true, uniqueness: true 
end
