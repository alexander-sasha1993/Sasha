class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    #Для подстановки нужны следующие переменные
    @clients=Client.all
    @deliveries=Delivery.all
    @employees=Employee.all
    @ordereds=Ordered.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @ordereds=Ordered.all
    @preparats=Preparat.all
    @order.ordereds.build
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params_create)

    respond_to do |format|
    if @order.save && @order.update(order_params_create_2)
      #Обновляем поля
      Ordered.all.each do |myord|
        if myord.order_id==@order.id
          Ordered.update(myord.id, :quantity => 1, :discount => 0)
        end
      end
      format.html { redirect_to @order, notice: 'Новый заказ был успешно оформлен.' }          
      format.json { render :show, status: :created, location: @order }
    else
      format.html { render :new }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @ordered.each do |ord|
      #уничтожаем все объекты из таблице многие ко многим, чтобы обновление было корректно
      if @order.id==ord.order_id
         Ordered.find(ord.id).destroy
      end
    end
    respond_to do |format|
      if @order.update(order_params_update)
        format.html { redirect_to @order, notice: 'Информация о заказе была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Информация о заказе была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      #Также нужны переменные
      @client=Client.find(@order.client_id)
      @delivery=Delivery.find(@order.delivery_id)
      @employee=Employee.find(@order.employee_id)
      @ordered=Ordered.where("order_id=?",@order.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params_update
      params.require(:order).permit( :datepublic, :dateperformance, :costdelivery, :client_id, :delivery_id, :employee_id, ordereds_attributes: [ :order_id, :preparat_id, :quantity, :discount, :_destroy])
        #ordererds: [ :order_id, :preparat_id, :quantity, :discount]
        #:datepublic, :dateperformance, :costdelivery, :client_id, :delivery_id, :employee_id)
    end

    def order_params_create
      params.require(:order).permit( :datepublic, :dateperformance, :costdelivery, :client_id, :delivery_id, :employee_id)
        #ordererds: [ :order_id, :preparat_id, :quantity, :discount]
        #:datepublic, :dateperformance, :costdelivery, :client_id, :delivery_id, :employee_id)
    end

    def order_params_create_2
      params.require(:order).permit( :datepublic, :dateperformance, :costdelivery, :client_id, :delivery_id, :employee_id, preparat_ids: [])
        #ordererds: [ :order_id, :preparat_id, :quantity, :discount]
        #:datepublic, :dateperformance, :costdelivery, :client_id, :delivery_id, :employee_id)
    end
end
