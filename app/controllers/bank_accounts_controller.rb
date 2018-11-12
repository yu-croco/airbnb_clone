class BankAccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    session[:id] = @user.id
  end

  private
end
