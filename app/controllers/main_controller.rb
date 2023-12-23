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
    @products = Product.find_by(name: params[:product])
  end

  def add_to_cart
    @user = User.find(session[:user_id])
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    if @user.order.nil?
      @user.order = Order.create(user_id: @user.id, total_amount: 0, order_status: false)
    end
    @user.order.order_lines << Order_lines.create(product_id: id, quantity: 1, order_id: @user.order.id)
    # @order = Order.find(session[:order])
    # prod = Product.find(params[:id])
    # @order.products.create(name: prod.name, price: prod.price, quantity: 1) unless @order.products.any? { |p| p.name == params[:id].name }
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    # @order = Order.find(session[:order])
    # id = params[:id].to_i
    # @order.products.find(id).destroy
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
    # Order.find(session[:order]).destroy
    # session[:order] = nil
    redirect_to root_path
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
    session[:cart] ||= []
    @user = User.create
    session[:user_id] = @user.id
    # @order = Order.create
    # session[:order] = @order.id
  end

  def load_cart
    @cart = Product.find(session[:cart])
    # @order = Order.find(session[:order])
  end
end
