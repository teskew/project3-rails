class OrdersController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_order, except: [:index, :new, :create]
    
    def index #
      if params[:company_id] && @company = Company.find_by(id:params[:company_id]) 
         @orders = @company.orders #nested
      else
        @error = "That Order doesn't exit" if params[:company_id]
        @orders = Order.all
      end
      
      end 
      
      def new 
        #nested and find the order
        if params[:company_id]
           @company = Company.find_by(id: params[:company_id]) 
              @order = @company.orders.build
         else
           # @error = "That Order doesn't exit" if params[:company_id]
              @order = Order.new
               @order.build_company
  
          end
         end

      def create 
        if params[:company_id]
          @company = Company.find_by(id: params[:company_id]) 
          @order = @company.orders.build(order_params)
        else
          @order = Order.new(order_params)
        end
         if @order.save 
          # redirect_to company_orders_path(@order.company) #([@order.companies,@order])
          redirect_to order_path(@order)
         else 
           render :new
         end 
        end
        
   

  
    def show 
        # @order = Order.find_by(id: params[:id])
        #  redirect_to orders_path if !@order
    end
  
    def edit
      # @order = Order.find_by(id: params[:id])
    end
  
    def update 
      # @order = Order.find_by(id: params[:id])
      if@order.update(order_params)
        redirect_to order_path(@order)
      else 
        render :edit
      end 
    end 
  
    def destroy
      set_order
       #@order = Order.find_by(id: params[:id])
       @order.destroy
      redirect_to orders_path
    end 
  
    private 
  
    def order_params
      params.require(:order).permit(:beer_name, :description, :quantity, :company_id, :user_id)
      #company_attributes:[:company_name] ) #,:adress
    end

    def set_order
     @order = Order.find_by_id(params[:id])
    end 


end
