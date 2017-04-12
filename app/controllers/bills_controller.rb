class BillsController < ApplicationController

  def index
    @bills = current_user.bills.paginate(:page => params[:page]).order(date_input: :desc)
  end

  def new
    @bill = Bill.new
  end

  def edit
  end
end
