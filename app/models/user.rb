class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX = /@.+/.freeze

  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :watches, dependent: :destroy

  validates :username, presence: true

  validates_format_of :email, with: EMAIL_REGEX

  generate_public_uid

  def to_param
    public_uid
  end
end
