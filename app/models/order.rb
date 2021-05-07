class Order < ApplicationRecord
  belongs_to :company
  belongs_to :user
 validates :order, presence: true
end
