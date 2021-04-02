class Event < ApplicationRecord
  has_one :watch

  validates :event, presence: true
end
