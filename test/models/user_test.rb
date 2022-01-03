require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(username: "Exampleuser", email: "example@example.com", password: "examplepsw")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" *21
    assert_not @user.valid?
  end
  test "email should be present " do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be in correct format" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.]
  invalid_addresses.each do |invalid_address|
    @user.email = invalid_address
    assert_not @user.valid?
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email

  end
end
