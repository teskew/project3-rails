class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
       t.string :name
       t.string  :type
       t.decimal :price
       t.integer :quantity
       t.decimal :total
       t.belongs_to :company
       t.belongs_to :user
       t.timestamps
    end
  end
end
