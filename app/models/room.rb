class Room < ApplicationRecord
  has_many :users, through: :room_users
  has_many :messages

  validates :thread_name, presence: true
end
