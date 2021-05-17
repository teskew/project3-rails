class Company < ApplicationRecord

  has_many :orders
  has_many :users, through: :orders
  validates :company_name, presence: true 

 accepts_nested_attributes_for :orders

 def self.co_orders 
    joins(:orders).group('orders.company_name')
 end


end
