class TenkiFeedsController < ApplicationController
  def new
    @tenki_feed = TenkiFeed.new
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

  private
  def tenki_feed_params
    params.require(:tenki_feed).permit(:location_id, :location_name, :time, :user_id)
  end
end
