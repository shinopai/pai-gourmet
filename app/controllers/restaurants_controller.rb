class RestaurantsController < ApplicationController
  def show_all
    @restaurants = Restaurant.page(params[:page]).per(20).order(id: :desc)

    render :all
  end
end
