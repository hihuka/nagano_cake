class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

	def new
		@order = Order.new
		@addresses = current_customer.addresses
	end

	def thanks
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id

		if params[:order_address] == "option1"
			@order.postal_code = current_customer.postal_code
			@order.address = current_customer.address
			@order.name = current_customer.last_name + current_customer.first_name
		elsif params[:order_address] == "option2"
			@address = Address.find(params[:order][:select_address])
			@order.address = @address.address
			@order.name = @address.name
			@order.postal_code = @address.postal_code
		elsif params[:order_address] == "option3"
		end

		@cart_items=current_customer.cart_items
	end

	def create
		@order = Order.new(order_params)
		@order.save
    #saveでOrderモデルにorder_idが入る

		#注文詳細内容の保存
		current_customer.cart_items.each do |cart_item|
			@order_detail = OrderItem.new
			@order_detail.order_id = @order.id
			@order_detail.item_id = cart_item.item_id
			@order_detail.tax_price = cart_item.tax_price
			@order_detail.amount = cart_item.amount
			@order_detail.save!
		end

		current_customer.cart_items.destroy_all

		redirect_to orders_complete_path
	end

	def complete
	end

#会員の注文履歴一覧表示(うえ)
	def index
		@orders = current_customer.orders

	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

private

def order_params
	params.amount(:order).permit(:customer_id, :payment_method, :total_payment, :postal_code, :address, :name)
end

end
