class StatusesController < ApplicationController

  def index
    @statuses = Status.all
    render json:@statuses
  end

  def show
       @status = Status.find(params[:id])
       render json: @status
   end
end
