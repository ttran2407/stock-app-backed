class WatchlistsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @watchlists = @user.watchlists
    render json:@watchlists
  end

  def show
       @watchlist = Watchlist.find(params[:id])
       render json: @watchlist
   end

   def create
     @watchlist = Watchlist.create(watchlist_params)
     @user = User.find(params[:user_id])
     @watchlists = @user.watchlists
     render json: @watchlists
   end

   def destroy
     @watchlist = Watchlist.find(params[:id])
     @watchlist.destroy
     @user = User.find(params[:user_id])
     @watchlists = @user.watchlists
     render json: @watchlists

   end

   private
   def watchlist_params
      params.require(:watchlist).permit(:user_id,:stock_id,:stock_symbol)
   end
end
