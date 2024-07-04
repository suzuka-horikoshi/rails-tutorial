require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, content: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    log_in_as(@user)
    get edit_user_path(@user)
    assert_select "a[href=?]", users_path
  end

  test "signup page" do
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
