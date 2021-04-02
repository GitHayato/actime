class Distance < ApplicationRecord
  has_one :watch

  validates :distance, presence: true
end
