class Distance < ApplicationRecord
  belongs_to :watch, optional: true

  validates :distance, presence: true
end
