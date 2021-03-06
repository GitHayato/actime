class Watch < ApplicationRecord

  validates :thread_name, presence: true

  belongs_to :room
  belongs_to :user, optional: true
end
