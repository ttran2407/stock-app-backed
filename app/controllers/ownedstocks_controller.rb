class OwnedstocksController < ApplicationController
  skip_before_action :authorized
  def index
    @user = User.find(params[:user_id])
    @ownedstocks = @user.ownedstocks
    render json: @ownedstocks
  end

  def show
       @ownedstock = Ownedstock.find(params[:id])
       render json: @ownedstock
   end

   def create
     @user = User.find(ownedstock_params[:user_id])
     @ownedstock = @user.ownedstocks.find_by(stock_symbol: ownedstock_params[:stock_symbol])
     if @ownedstock != nil
       @ownedstock.update(quantity: (ownedstock_params[:quantity] + @ownedstock[:quantity]))
     else
       @ownedstock = Ownedstock.create(
         user_id: ownedstock_params[:user_id],
        stock_id: ownedstock_params[:stock_id],
        quantity: ownedstock_params[:quantity],
        stock_symbol: ownedstock_params[:stock_symbol],
       )
     end
     @cost = ownedstock_params[:quantity] * params[:price]
     @user.update(cash: (@user[:cash].to_i - @cost))
     @ownedstocks = @user.ownedstocks
     render json: {ownedstocks: @ownedstocks,user: @user}
   end

   def update
     @ownedstock = Ownedstock.find(ownedstock_params[:id])
     if @ownedstock[:quantity] > ownedstock_params[:quantity]
       @ownedstock.update(quantity: (@ownedstock[:quantity] - ownedstock_params[:quantity]))
     else
       @ownedstock.destroy
     end
     @user = User.find(ownedstock_params[:user_id])
     @revenue = ownedstock_params[:quantity] * params[:price]
     @user.update(cash: (@user[:cash].to_i + @revenue))
     @ownedstocks = @user.ownedstocks
     render json: {ownedstocks: @ownedstocks, user: @user}
   end

   private
   def ownedstock_params
      params.require(:ownedstock).permit(:user_id,:stock_id,:stock_symbol, :quantity, :price, :id)
   end
end
