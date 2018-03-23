class V1::CategoriesController < ApplicationController
  def index
    all_categories = Category.all
    render json: all_categories.as_json
  end
end
