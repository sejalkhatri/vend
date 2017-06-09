class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  def send_data
    products = Array[]
    total_products =Array[]
    @p = Product.all
    puts "---ALL PRODUCCTS-----"
    @p.each do |pp|
      n = pp.name
      total_products.push(n)
    end
    puts total_products
    @order = current_order
    puts @order
    puts "-----------------ORDER ITEMS ----------------"
    @order_items = current_order.order_items
    puts "----------------PRODUCTS---CHECKING THIS NOW------------"
    @order_items.each do |order_item|
      puts order_item.product.name
      products.push(order_item.product.name)
    end
    puts "---------ARRAYYYYYYYY PRODUCTS IN A CART-----------"
    puts products
    puts "--------------------PRODUCTS NOT IN THE CART---------------"
    unselected_products = (total_products-products) | (products-total_products)
    puts unselected_products
    unselected_products.each do |up|
      puts "loooooppp"
      puts up
      if up == "CocaCola"
        require 'open-uri'
        open("https://api.thingspeak.com/update?api_key=Y0S58JCEY5F2P5J6&field1=0")
      end

      if up == "Pepsi"
        require 'open-uri'
        open("https://api.thingspeak.com/update?api_key=396L15QTL43AM94L&field1=0")
      end

      if up == "Bisleri"
        require 'open-uri'
        open("https://api.thingspeak.com/update?api_key=YE16Y908LA2KL5NL&field1=0")
      end
    end
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
