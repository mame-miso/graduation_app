class Item < ApplicationRecord
  belongs_to :place
  has_one_attached :image

  validates :image, presence: true
end
