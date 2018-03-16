class V1::SuppliersController < ApplicationController
  def index
    suppliers = Supplier.all
    render json: suppliers.as_json
  end

  def create
    
  end

  def show
    
  end

  def edit
    
  end

  def destroy
    
  end
end
