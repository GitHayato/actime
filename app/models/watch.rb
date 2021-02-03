class Watch < ApplicationRecord

  with_options presence: true do
    validates :watch
  end
end
