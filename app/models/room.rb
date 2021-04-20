class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :watches, dependent: :destroy

  validates :thread_name, presence: true
  validates :public_uid, presence: true, uniqueness: true

  generate_public_uid

  def to_param
    public_uid
  end
end
