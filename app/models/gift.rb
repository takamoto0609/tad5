class Gift < ApplicationRecord
  belongs_to :user

  validates :gift_id, :point, :name, :address, presence: true
end
