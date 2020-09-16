class Admin::DashboardController < ApplicationController
  before_filter :authenticate
  def show
    @countProducts = Product.all.count
    @countCategories = Category.all.count
  end

  protected 

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["username"] && password == ENV["password"]
    end
  end

end
