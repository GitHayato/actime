class Watch < ApplicationRecord

  with_options presence: true do
    validates :watch
    validates :room_id
  end
  belongs_to :room
end
