class PortfoliosController < ApplicationController
  
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
    3.times { @portfolio_item.technologies.build }
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
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
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


































