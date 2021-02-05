class Room < ApplicationRecord
  has_many :users

  validates :thread_name, presence: true
end
