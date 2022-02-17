class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|

      t.integer :customer_id
      t.string :zip_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
