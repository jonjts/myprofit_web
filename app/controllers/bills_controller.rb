class BillsController < ApplicationController
  before_action :check_is_mine, :only => [:edit, :destroy, :show, :update]
  before_action :set_bill, :only => [:update, :destroy, :edit, :show]

  def index
    @bills = current_user.bills.paginate(:page => params[:page], :per_page => 3).order(date_input: :desc)
    @bill = Bill.new
  end

  def search
    @bills = Bill.search(current_user,params[:title], params[:input_min],
                         params[:input_max], params[:output_min],
                         params[:output_max],params[:date_min],
                         params[:date_max]).paginate(:page => params[:page]).order(date_input: :desc)
    respond_to do |format|
      format.js
    end
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(params_bill)
    puts @bill.date_input
    @bill.user = current_user
    if @bill.save
      flash[:success] = t('messages.bill_saved')
      redirect_to bills_path
    else
      flash[:danger] = @bill.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @bill.update(params_bill)
      flash[:success] = t('messages.bill_updated')
      redirect_to bills_path
    else
      flash[:danger] = @bill.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @bill.destroy
      redirect_to bills_path
      flash[:success] = t('messages.bill_removed')
    else
      flash[:danger] = @bill.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def params_bill
    params.require(:bill).permit(:title, :input, :output, :date_input)
  end

  def check_is_mine
    if Bill.find(params[:id]).user != current_user
      flash[:danger] = t('messages.can_not_see_it')
      redirect_to bills_path
    end
  end

end
