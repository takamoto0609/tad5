class Item < ApplicationRecord
  belongs_to :user
  has_many :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :wash_power
  belongs_to :status

  validates :comment, :address, :point, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
