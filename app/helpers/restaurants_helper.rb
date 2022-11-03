module RestaurantsHelper
  # check if area name exists
  def check_area_name(name)
    Area.where(name: name).any?
  end

  # check if already keep restaurant
  def check_keep_restaurant(user_id, resto_id)
    res = Keep.where(user_id: user_id).where(restaurant_id: resto_id)
    res.any?
  end
end
