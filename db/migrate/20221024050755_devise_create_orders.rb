# frozen_string_literal: true

class DeviseCreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
       t.integer :customer_id
      t.integer :payment_method, default: 0
      t.integer :order_status, default: 0
      t.integer :shipping_cost, default: 800
      t.integer :total_payment
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
