class Order < ApplicationRecord
  belongs_to :company
  belongs_to :user
 validates :name, presence: true
end
