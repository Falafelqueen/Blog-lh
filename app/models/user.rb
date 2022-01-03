class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :username, presence: true, length: {maximum: 20}, uniqueness: true {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, on: :create
end