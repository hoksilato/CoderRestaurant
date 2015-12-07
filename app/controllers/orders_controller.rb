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
        format.html { redirect_to finish_order_path(@order), notice: 'Order was successfully created. Thank you!' }
        format.json { render :show, status: :created, location: finish_order_path(@order) }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    @order = Order.find(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_name, :phone, :address, :coupon_code, :price)
    end
end
