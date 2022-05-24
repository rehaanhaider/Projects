class User < ActiveRecord::Base
    has_many :articles
    before_save { self.email = email.downcase }
    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }

    has_many :received_follows, -> { distinct }, foreign_key: :followed_user_id, class_name: "Follow"
    has_many :followers, -> { distinct }, through: :received_follows, source: :follower
    has_many :given_follows, -> { distinct }, foreign_key: :follower_id, class_name: "Follow"
    has_many :followings, -> { distinct }, through: :given_follows, source: :followed_user
end
