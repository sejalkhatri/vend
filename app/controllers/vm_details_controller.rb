class VmDetailsController < ApplicationController
  def add_quantity
    puts params[:vendingmachine_id]
    puts params[:p_id]
    puts params[:quantity]
    # @permission = Permission.find_by_user_id_and_project_id(params[:user_id],params[:project_id])
    @vm_details= VmDetail.find_by_vendingmachine_id_and_product_id( 1,params[:p_id])
    if @vm_details
      quantity=Integer(@vm_details[:quantity]) + Integer(params[:quantity])
      # puts quantity
      #@vm_details[:quantity]= quantity
      #puts @vm_details[:quantity]
      @vm_details.update(:quantity => quantity)
    else
      @vm_details=VmDetail.new(:vendingmachine_id => 1, :product_id=>params[:p_id],:quantity => params[:quantity])
    end

    if @vm_details.save
      redirect_to(:controller => 'vendor', :action => 'add_product')
    end
  end

  def list_products
    @vm_details = VmDetail.where(vendingmachine_id: 1)
    # @name = Product.find(@vm_details[0].product_id).name
  end

  def subtract_quantity
    @order_items = current_order.order_items
    @order_items.each do |order_item|
      @vm_details = VmDetail.find_by_product_id(order_item.product.id)
      puts @vm_details
      puts "---in the loop===="
      puts order_item.product.name
      quantity= order_item.quantity
      updated_quantity = Integer(@vm_details[:quantity]) - Integer(quantity)
      @vm_details.update(:quantity => updated_quantity)
    end
    @vm_details&.save
    redirect_to(:controller => 'carts', :action => 'show')
  end
end
