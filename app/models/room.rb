class Room < ApplicationRecord
  has_many :users
  has_many :messags

  validates :thread_name, presence: true
end
