# frozen_string_literal: true

class DeviseCreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
     t.integer :coustomer_id
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
