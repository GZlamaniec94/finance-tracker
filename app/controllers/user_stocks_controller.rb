class UserStocksController < ApplicationController
  
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "#{stock.name} added to your account."      
    redirect_to my_account_path
  end

  def destroy
    stock = Stock.find(params[:id]) 
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "#{stock.ticker} successfully removed."
    redirect_to my_account_path
  end  
end
