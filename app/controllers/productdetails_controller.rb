class ProductdetailsController < ApplicationController
  def show
    machineid = params[:machineid]
    @machine = Vendingmachine.find_by_id(machineid)
    @product = @machine.products
  end
end
