module HomeHelper
  def get_area_id(str)
    res = Area.where(name: str)
    res[0].id
  end

  def get_genre_id(str)
    res = Genre.where(name: str)
    res[0].id
  end

  def number_of_resto_by_area(id)
    Restaurant.where(area_id: id).count
  end

  def number_of_resto_by_genre(id)
    Restaurant.where(genre_id: id).count
  end
end
