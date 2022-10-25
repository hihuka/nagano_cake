class CartItem < ApplicationRecord
  belongs_to :item
	belongs_to :customer

	validates :customer_id, presence: true
	validates :item_id, presence: true
	validates :amount, presence: true

	def tax_price
		(item.price.to_i * 1.1).floor
	end

	def sub_price
		self.tax_price * self.amount
	end

	def total_payment
		CartItem.total_
	end
end
