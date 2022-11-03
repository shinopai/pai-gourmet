class KeepsController < ApplicationController
  before_action :authenticate_user!

  def keep_restaurant
    user = User.find(params[:id])
    restaurant = Restaurant.find(params[:restaurant_id])
    user.restaurants << restaurant

    redirect_to request.referer, notice: restaurant.name + 'を保存しました'
  end

  def remove_keep_restaurant
  @keep = Keep.where(user_id: params[:id]).find_by(restaurant_id: params[:restaurant_id])
  @keep.destroy

  redirect_to request.referer, notice: 'お店の保存を解除しました'
end
end
