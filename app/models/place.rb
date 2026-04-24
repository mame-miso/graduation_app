class Place < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :cover_image
end
