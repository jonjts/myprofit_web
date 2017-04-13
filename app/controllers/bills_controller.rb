class BillsController < ApplicationController
  before_action :check_is_mine, :only => [:edit, :destroy, :show, :update]
  before_action :set_bill, :only => [:update, :destroy, :edit, :show]

  def index
    @bills = current_user.bills.paginate(:page => params[:page]).order(date_input: :desc)
    @bill = Bill.new
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(params_bill)
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
