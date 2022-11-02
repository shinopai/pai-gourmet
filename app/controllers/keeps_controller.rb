class KeepsController < ApplicationController
  before_action :authenticate_user!

  def keep_restaurant
    user = User.find(params[:id])
    restaurant = Restaurant.find(params[:restaurant_id])
    user.restaurants << restaurant

    redirect_to request.referer, notice: restaurant.name + 'を保存しました'
  end
end
