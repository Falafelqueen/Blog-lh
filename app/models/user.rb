class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :username, presence: true, length: {maximum: 20}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, on: :create
  validates :password, presence:true, length: {minimum: 6}
  has_secure_password
  has_many :articles
end
