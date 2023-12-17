class MainController < ApplicationController
  before_action :initialize_session, only: [:index]
  before_action :increment_visit_count
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
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_back(fallback_location: root_path)
  end

  def add_new_product
    @products = Product.all
    Product.create(name: params[:name], price: params[:price], quantity: params[:quantity]) unless @products.any? { |p| p.name == params[:name] }
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
    session[:visit_count] ||= 0 
    session[:cart] ||= [] 
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
end
