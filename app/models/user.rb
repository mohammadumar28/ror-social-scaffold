class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, -> { where(confirmed: true) }, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend
  has_many :inverse_friendships, -> { where(confirmed: false) },
           class_name: 'Friendship', foreign_key: :friend_id, dependent: :destroy
  has_many :friend_requests, through: :inverse_friendships, source: :user
end
