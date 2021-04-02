class Watch < ApplicationRecord

  validates :watch, presence: true

  belongs_to :room
  belongs_to :user, optional: true
  belongs_to :event, optional: true
  belongs_to :distance, optional: true
end
