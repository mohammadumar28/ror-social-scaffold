class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :friend_id


  def friends
    friends = []
    friendships.each { |friendship| friends << friendship.friend if friendship.confirmed }
    inverse_friendships.each { |friendship| friends << friendship.user if friendship.confirmed }
    friends.compact
  end

  def pending_friends
    friends = []
    friendships.each { |friendship| friends << friendship.friend if !friendship.confirmed }
    friends.compact
  end

  def friend_requests
    friends = []
    inverse_friendships.each { |friendship| friends << friendship.user if !friendship.confirmed }
    friends.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find{ |friendship| friendship.user == user }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
