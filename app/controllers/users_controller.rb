class UsersController < ApplicationController
  def my_account
    @tracked_stocks = current_user.stocks
  end
end
