class TenkiFeedsController < ApplicationController
  def new
    @tenki_feed = TenkiFeed.new
    @prefectures = Prefecture.all
    @cities = City.all
  end

  def create
    @tenki_feed = TenkiFeed.new(tenki_feed_params)
    if @tenki_feed.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end

  def show
  end

  def cities_select
    if request.xhr?
      @cities = City.all
      render partial: 'cities_select', locals: { prefecture_id: params[:prefecture_id], cities: @cities}
    end
  end

  private
  def tenki_feed_params
    params.require(:tenki_feed).permit(:prefecture_id, :city_id, :time, :user_id)
  end
end
