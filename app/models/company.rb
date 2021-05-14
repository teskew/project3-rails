class Company < ApplicationRecord

has_many :orders
has_many :users, through: :orders
 validates :company_name, presence: true 
 validates :address, presence: true 
 accepts_nested_attributes_for :orders

end
