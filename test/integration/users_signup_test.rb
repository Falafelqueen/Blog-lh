require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
   test "only valid form submitions create user" do
     get signup_path
     assert_no_difference 'User.count' do
          post users_path, params: { user: { username: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar" } }
   end
   assert_template "users/new"
  end

  test "valid form submitions create new user" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: {
        username: "Validusername",
        email: "validemail@email.com",
        password: "validpsw",
        password_confirmation: "validpsw"
      }}
    end
    follow_redirect!
    assert_template "articles/index"
    assert logged_in?
  end

end
