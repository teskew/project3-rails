class Company < ApplicationRecord
belongs_to :user 
has_many :orders
has_many :users, through: :orders
validates :name, presence: true
end
