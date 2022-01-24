require 'rails_helper'

RSpec.describe User, type: :model do

  context "User model validation" do

    it "is not valid without an username" do
      user = User.new(email: "example2@example.com", password: "example")

      expect(user).not_to be_valid
    end

    it "is not valid if the username already exists" do
      user = User.new(username:"example2", email: "example", password: "example")
      user2 = User.new(username:"example2", email: "example", password: "example")

      expect(user2).not_to be_valid
    end

    it "is not valid if the username is too long" do
      user = User.new(username:"exampleisveryloooooooong", email: "example2@example.com", password: "example")

      expect(user).not_to be_valid
    end

    it "is not valid without an email" do
      user = User.new(username: "example2", password: "example")

      expect(user).not_to be_valid
    end

    it "is valid only if the email address is in a valid format" do
      user = User.new(username:"example2", email: "example2.example.com", password: "example")
      user2 = User.new(username:"example2", email: "example2@example.com", password: "example")
      expect(user).not_to be_valid
      expect(user2).to be_valid
    end

    it "is valid only with password" do
      user = User.new(username:"example2", email: "example2@example.com")
      expect(user).not_to be_valid
    end

    it "is not valid if the password is too short" do
      user = User.new(username:"example2", email: "example2@example.com", password: "123")
      expect(user).not_to be_valid
    end

  end

end
