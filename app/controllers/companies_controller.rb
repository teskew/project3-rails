class CompaniesController < ApplicationController
    # before_action :set_company, except: [:index, :new, :create]
     before_action :redirect_if_not_logged_in

     def index 
      if params[:user_id] &&  @user = User.find_by_id(params[:user_id]) 
        @companies = @user.companies
       else
         @error = "That company doesn't exit" if params[:user_id]
         @companies = Company.all
       end
      end
    
      def new 
        if params[:user_id] &&  @user = user.find_by_id(params[:user_id]) 
          @companies = @user.companies.build
          #@company
         else
           @error = "That company doesn't exit" if params[:user_id]
           @company = Company.new
         end
      end
    
      def create 
          @company = current_user.companies.build(company_params)
        if @company.save 
           redirect_to companies_path
        else 
          render :new
        end 
      end 
    
      def show 
        @company = Company.find_by_id(params[:id])
        redirect_to company_path if !@Company
      end

      # def edit
      # end
    
      # def update 
      #   if @company.update(company_params)
      #       redirect_to company_path(@company)
      #   else 
      #       render :edit
      #   end 
      # end 
    
      # def destroy
      # @company.destroy
      #   redirect_to companies_path
      # end 
     
    
      private 

      def company_params
        params.require(:company).permit(:name, :address, :phone, :user_id, :user_id)
      end 

      def set_company
      @company = Company.find_by_id(params[:id])
      end 
 end



