class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place

  def new
    @item = @place.items.build
  end

  def create
    @item = @place.items.build(item_params)
    if @item.save
      redirect_to @place, notice: "写真を登録しました"
    else
      flash.now[:alert] = "写真を選択してください"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item = @place.items.find(params[:id])
    @item.destroy
    redirect_to @place, notice: "写真を削除しました"
  end

  private

  def set_place
    @place = current_user.places.find(params[:place_id])
  end

  def item_params
    params.fetch(:item, {}).permit(:image)
  end
end