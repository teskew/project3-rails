class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
       t.string :name
       t.string :address
       t.integer :phone
       t.belongs_to :user 
      t.timestamps
    end
  end
end
