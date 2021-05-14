class Order < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :user, optional: true
  validates :beer_name, presence: true
  validates :description, presence: true
  validates :quantity, presence: true


end
