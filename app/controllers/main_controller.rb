class MainController < ApplicationController
  def index
    @products = Product.all
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

  def shop
    @products = Product.where(name: params[:product])
  end

  def wishlist; end
end
