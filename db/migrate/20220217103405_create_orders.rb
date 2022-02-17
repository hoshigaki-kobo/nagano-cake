class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :zip_code
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :order_status
      t.integer :total_amount
      t.integer :payment

      t.timestamps
    end
  end
end
