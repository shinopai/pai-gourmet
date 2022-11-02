module RestaurantsHelper
  # check if area name exists
  def check_area_name(name)
    Area.where(name: name).any?
  end
end
