class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  has_one_attached :image
  validates :image, content_type: [ "image/png", "image/jpg", "image/jpeg" ], size: { less_than: 5.megabytes }
end
