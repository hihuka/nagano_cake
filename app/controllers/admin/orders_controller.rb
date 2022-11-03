class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(8)
  end

  def current_user_order
    @orders = Order.where(customer_id: params[:id])
    @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(8)
    render action: :index
  end

  def show
    @order = Order.find(params[:id])
    @order_genres = @order.order_genres
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "注文ステータスを変更しました"
    #注文ステータスを「入金確認」にすると全ての製作ステータスが「製作待ち」に自動更新
    #→→ orderモデルに記載
    redirect_back(fallback_location: root_path)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
