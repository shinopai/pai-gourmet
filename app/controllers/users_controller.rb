class UsersController < ApplicationController
  before_action :authenticate_user!

  def show_all_keeps
    user = User.find(params[:id])
    @restaurants = user.restaurants.page(params[:page]).per(20)
    @heading_word = user.name + 'さんの保存済のお店'

    render :keeps
  end
end
