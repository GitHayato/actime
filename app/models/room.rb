class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :watches, dependent: :destroy

  validates :thread_name, presence: true
end
