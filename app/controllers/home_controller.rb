class HomeController < ApplicationController

  def index
    do_search(Time.now.strftime("%m"), Time.now.strftime("%Y"))
  end

  def search
    do_search(params[:search_month], params[:search_year])
    respond_to do |format|
      format.js
    end
  end

  private
  def do_search(month, year)
    user_id = current_user.id

    @pie_values = Hash.new
    values_bills = Bill.for_month( user_id,
                                   month, year)

    @sum_input = values_bills.sum(:input)
    @sum_output = values_bills.sum(:output)

    @pie_values[t("activerecord.attributes.bill.input")] = @sum_input
    @pie_values[t("activerecord.attributes.bill.output")] = @sum_output

    @sum_balance = @sum_input - @sum_output
    @balance_color = 'primary'
    if @sum_balance < 0
      @balance_color = 'danger'
    end
  end
end
