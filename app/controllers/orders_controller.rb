class OrdersController < ApplicationController
    before_action :redirect_if_not_logged_in
  
    def index #
      if params[:company_id] &&  @company = Company.find_by_id(params[:company_id]) 
       @orders = @company.orders #nested
      else
        @error = "That Order doesn't exit" if params[:company_id]
      @orders = Order.all
      end
      
      end

      def create 
        @order = current_user.orders.build(order_params)
         if @order.save 
           redirect_to orders_path
         else 
           render :new
         end 
        end
    def new 
   #nested and find the order
    if params[:company_id] &&  @company = Company.find_by_id(params[:company_id]) 
         @order = @company.orders.build
     else
         @error = "That Order doesn't exit" if params[:company_id]
         @order = Order.new
     end
    end

  
    def show 
        @order = Order.find_by(id: params[:id])
         redirect_to orders_path if !@order
    end
  
    def edit
      @order = Order.find_by(id: params[:id])
    end
  
    def update 
      @order = Order.find_by(id: params[:id])
      if@order.update(order_params)
        redirect_to order_path(@order)
      else 
        render :edit
      end 
    end 
  
    def destroy
     @order.destroy
      redirect_to orders_path
    end 
  
    private 
  
    def order_params
      params.require(:order).permit(:beer_name, :description, :quantity, :user_id, :company_id )
    end

    # def set_order
    #  @order = Order.find_by_id(params[:id])
    # end 


end
