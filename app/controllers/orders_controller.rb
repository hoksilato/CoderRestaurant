require 'net/smtp'

class OrdersController < ApplicationController
  def new
  	@dish = Dish.find(params[:id])
  	@order = Order.new
  end

  def create
  	@dish = Dish.find(params[:dish_id])
  	@order = Order.new(order_params)

  	respond_to do |format|
      if @order.save
      	@orderItem = OrderItem.create(
          quantity: 1,
          order_id: @order.id,
          dish_id: @dish.id
  		  )
        format.html { redirect_to finish_order_path(@order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: finish_order_path(@order) }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    @order = Order.find(params[:id])
    order_finish_url = url_for :controller => 'orders', :action => 'finish', :id => @order.id, :email => false

    if params[:email].nil? || params[:email].empty?
      message = <<EOF
From: Coder Restaurant <hotvitmuoi01@gmail.com>
To: #{@order.customer_name} <#{@order.email}>
Subject: Coder Restaurant - Order succeeded!
Thank you for your order.

You can view your order detail at: #{order_finish_url}
EOF
      #Using Block
      smtp = Net::SMTP.new('smtp.gmail.com', 587 )
      smtp.enable_starttls
      # smtp.start('gmail.com', 'hotvitmuoi01@gmail.com', '12345679', :login) do |smtp|
      #   smtp.send_message message, 'hotvitmuoi01@gmail.com', @order.email
      # end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_name, :phone, :address, :email, :coupon_code, :price)
    end
end
