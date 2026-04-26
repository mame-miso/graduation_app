class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_places

  def index
    @places = current_user.places
                          .left_joins(:items)
                          .group(:id)
                          .order(Arel.sql("MAX(items.created_at) DESC NULLS LAST, places.created_at DESC"))
                          .with_attached_cover_image
  end

  def show
  end

  def new
    @place = Place.new
    @item = Item.new
  end

  def create
    @place = current_user.places.build(place_params)

    if @place.save
      redirect_to @place, notice: "場所を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: "場所を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path, notice: "場所を削除しました"
  end

  private

  def set_place
    @place = current_user.places.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :cover_image)
  end

  def redirect_to_places
  redirect_to places_path, alert: "指定された場所は見つかりません"
  end
end