class CompaniesController < ApplicationController
    # before_action :set_company, except: [:index, :new, :create]
     before_action :redirect_if_not_logged_in

     
    
      def new 
        if params[:user_id] &&  @user = User.find_by_id(params[:user_id]) 
          @companies = @user.companies.build #nested
         else
           
         @companies = Company.new
         end 
        end
         
      def index #
        if params[:user_id] &&  @user = User.find_by_id(params[:user_id]) 
         @companies = @user.companies #nested
        else
          @error = "That Companies doesn't exit" if params[:company_id]
          @companies = Company.all
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

  
     
    
      private 

      def company_params
        params.require(:company).permit(:company_name, :address)
      end 

      def set_company
      @company = Company.find_by_id(params[:id])
      end 
 end



