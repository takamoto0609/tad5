class Item < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one :chat

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :wash_power
  belongs_to :status

  validates :wash_power_id, :status_id, :comment, :address, :point, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
