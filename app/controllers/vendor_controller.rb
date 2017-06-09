class VendorController < ApplicationController
  def login
  end

  def signup
  end

  def add_product

    if not params[:vendingmachines_id]
        params[:vendingmachines_id]=1
    end
    puts "-----------"
    puts params[:vendingmachines_id]
    puts "-----------"

  end

  def create

    p=params[:product]
    product_name = p[:name]
    puts "HEEEEEEEEEEEEEEEEEEEEE"

    @product = Product.find_by_name(product_name)
    puts @product
    puts product_name
    if @product
      puts "product_id---------------------------------------"
      puts @product.id
      redirect_to(:controller =>'vm_details', :action => 'add_quantity', :vendingmachines_id =>params[:vendingmachines_id], :p_id => @product.id, :quantity => p[:quantity])
    else
      @product=Product.new(:name=>p[:name], :price => p[:price], :active => p[:quantity])
      @product.save!
      puts "-----after product saved"
      puts @product
      @product.errors.messages
      puts "product_id---------------------------------------"
      puts @product.id
      redirect_to(:controller =>'vm_details', :action => 'add_quantity', :vendingmachines_id =>params[:vendingmachines_id], :p_id => @product.id, :quantity => p[:quantity])
    end
  end

  def login_check
    p=params[:vendor]
    @user = Vendor.find_by_name(p[:name])
    if @user
      if @user[:password] === p[:password]
        redirect_to(:action=>'add_product',:vendingmachines_id =>1)
      else
        redirect_to(:action=>'login')
      end
    else
      redirect_to(:action=>'login')
    end
  end

  def signup_check
		p=params[:vendor]
    vendor=Vendor.new(:name => p[:name], :password => p[:password], :vendingmachines_id => 1)
    # vendor[:vendingmachines_id]=1

		if vendor.save
      puts vendor.errors.messages
    	redirect_to(:action=>'login')
		else
      puts vendor.errors.messages
			redirect_to(:action=>'signup')
		end
	end
  private
    def signup_params
      params.require(:vendor).permit(:name, :password,:vendingmachines_id)
    end

end
