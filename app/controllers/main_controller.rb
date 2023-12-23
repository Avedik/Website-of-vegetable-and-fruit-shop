class MainController < ApplicationController
  before_action :initialize_session, only: [:index]
  before_action :load_cart
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
  end

  def edit
    @products = Product.all
  end

  def shop
    @products = Product.where(name: params[:product])
  end

  def add_to_cart
    @user = User.find(session[:user_id])
    @user.order.order_lines.create(product_id: params[:id], quantity: 1)
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    @user = User.find(session[:user_id])
    @user.order.order_lines.where(product_id: params[:id]).delete_all
    redirect_back(fallback_location: root_path)
  end

  def remove_all_from_cart
    @user.order.order_lines.delete_all
    redirect_back(fallback_location: root_path)
  end

  def add_new_product
    unless Product.where(name: params[:name]).count > 0
      Product.create(name: params[:name], price: params[:price], quantity: params[:quantity])
    end
    redirect_back(fallback_location: root_path)
  end

  def remove_from_db
    Product.find(params[:id].to_i).destroy
    redirect_back(fallback_location: root_path)
  end

  def create
    OrderMailer.new_order_email.deliver_now
    redirect_to root_path
  end

  def count_cost
    @cart.order_lines.each do |cart_item|
      cart_item.quantity = params[cart_item.product_id.to_s]
      cart_item.save
    end
    redirect_back(fallback_location: root_path)
  end

  def login; end

  def about; end

  def account; end

  def blog; end

  def cart; end

  def checkout; end

  def compare; end

  def contact; end

  def product; end

  def register; end

  def wishlist; end

  private

  def initialize_session
    unless User.where(login: request.remote_ip.to_s).count > 0
      @user = User.create(login: request.remote_ip.to_s)
      @user.order = Order.create(user_id: @user.id, total_amount: 0, order_status: false)
      session[:user_id] = @user.id
    else
      session[:user_id] = User.where(login: request.remote_ip.to_s).first.id
    end
  end

  def load_cart
    @products = Product.all # !!!!!!!!!!!!!!!!!!!!!!!!! for searching
    @user = User.find_by(id: session[:user_id])
    @cart = @user.order
  end
end
