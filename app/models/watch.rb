class Watch < ApplicationRecord

  validates :watch, presence: true

  belongs_to :room
  belongs_to :user, optional: true
end
