class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, 
                                            :update, 
                                            :show, 
                                            :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all


  def index
    @portfolio_items = Portfolio.all
  end 

#****SCOPE EXAMPLE METHOD****

#So in the method below you have an example of using scope to reference a specific data query, 
#and the scope is defined in the model for the portfolio feature

#*********  There is an example route for this in the routes file, as well as an exmple view
  def scope
    @scope_portfolio_items = Portfolio.ruby
  end
#***************END SCOPE EXAMPLE FOR CONTROLLER


  def new
    @portfolio_item = Portfolio.new
  end


  def create
      @portfolio_item = Portfolio.new(portfolio_params)
  
      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live!' }
        else
          format.html { render :new }
          end
      end
    end

  def edit
    
  end

  def update
   

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
     
  end

  def destroy
    # Perform lookup
    @portfolio_item = Portfolio.find(params[:id])
    # Destroy/delete the record
    @portfolio_item.destroy
    # Redirect after record is destroyed/deleted
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Your portfolio item was successfully destroyed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name])
  end       

end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end































