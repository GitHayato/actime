class Message < ApplicationRecord
  has_many   :users
  bolongs_to :room

  validates :content, presence: true
end
