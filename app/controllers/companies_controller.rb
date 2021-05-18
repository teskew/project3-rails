class CompaniesController < ApplicationController
     before_action :set_company, except: [:index, :new, :create]
     before_action :redirect_if_not_logged_in
     
    def index #
      if params[:user_id] &&  @user = User.find_by_id(params[:user_id]) 
       @companies = @user.companies #nested
      else
        @error = "That Companies doesn't exit" if params[:company_id]
       @companies = Company.all
     end
    end

    
     def new 
        if params[:user_id] &&  @user = User.find_by_id(params[:user_id]) 
          @company = @user.companies.build #nested
         else 
         @company = Company.new
         end 
        end
    
      def create
        @company = Company.new(company_params)
         if @company.save 
          redirect_to companies_path(@company)
         else
           render :new 
         end
      end 
      

      def show 
        @company = Company.find_by(id:params[:id])
       # redirect_to companies_path if !@Company
      end

      def edit
      end

      def update 
        if @company.update(company_params)
            redirect_to company_path(@company)
        else 
            render :edit
        end 
      end 
    
      def destroy
        set_company
        @company.destroy
        redirect_to companies_path
      end 
  
     
    
      private 

      def company_params
        params.require(:company).permit(
          :company_name, 
          :address, 
          :user_id)
      end 

      def set_company
      @company = Company.find_by_id(params[:id])
      end 
 end



