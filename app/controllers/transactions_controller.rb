class TransactionsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @transactions = @user.transactions
    render json:@transactions
  end

  def show
       @transaction = Transaction.find(params[:id])
       render json: @transaction
   end

   def create
     @transaction = Transaction.create(transaction_params)
     @user = User.find(params[:user_id])
     @transactions = @user.transactions
     render json: {transactions: @transactions, transaction: @transaction}
   end

   private
   def transaction_params
      params.require(:transaction).permit(:user_id,:stock_id,:status_id,:quantity,:price,:stock_symbol, :transaction_type)
   end

end
