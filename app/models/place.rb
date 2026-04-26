class Place < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :cover_image, dependent: :purge_later

  validate :name_or_cover_image_present

  private

  def name_or_cover_image_present
    if name.blank? && !cover_image.attached?
      errors.add(:base, "場所名または写真のどちらかを登録してください")
    end
  end
end
