class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
       t.string :beer_name
       t.string  :description
       t.integer :quantity
       t.belongs_to :user
       t.belongs_to :company

       t.timestamps
    end
  end
end
