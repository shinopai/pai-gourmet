class HomeController < ApplicationController
  def index
    @genres = Genre.where.not(name: ['焼肉', '寿司', '居酒屋', 'イタリアン', 'ラーメン', 'カフェ'])
    @total_restaurants = Restaurant.count
  end
end
