class Message < ApplicationRecord
  has_many   :users
  belongs_to :room

  validates :content, presence: true
end
