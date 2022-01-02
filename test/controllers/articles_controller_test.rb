require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get show" do
    get article_url
    assert_response :success
  end

  test "should get create" do
    post articles_url
    assert_response :success
  end

  test "should get new" do
    get articles_new_url
    assert_response :success
  end

end
