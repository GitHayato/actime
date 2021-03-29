class Event < ApplicationRecord
  belongs_to :watch, optional: true

  validates :event, presence: true
end
