class RestaurantsController < ApplicationController
  def show_all
    @restaurants = Restaurant.page(params[:page]).per(20).order(id: :desc)
    @heading_word = '全国のお店'

    render :all
  end

  def show_all_by_area
    @area = Area.find(params[:id])
    @restaurants = Restaurant.where(area_id: @area).page(params[:page]).per(20).order(id: :desc)
    @heading_word = @area.name + 'のお店'

    render :all_by_area
  end

  def show_all_by_genre
    @genre = Genre.find(params[:id])
    @restaurants = Restaurant.where(genre_id: @genre).page(params[:page]).per(20).order(id: :desc)
    @heading_word = '全国の' + @genre.name

    render :all_by_genre
  end

  def show_detail
    @restaurant = Restaurant.find(params[:id])
    @heading_word = @restaurant.name

    render :show
  end

  def search_restaurant
    if check_area_name(params[:q][:area_id_cont])
      area = Area.where(name: params[:q][:area_id_cont])
      params[:q][:area_id_cont] = area.id
    end
    @restaurants = @q.result
  end

  # # private method
  # def set_q
  #   @q = Restaurant.ransack(params[:q])
  # end
end
