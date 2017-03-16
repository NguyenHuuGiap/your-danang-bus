require 'test_helper'

class UserTest < ActiveSupport::TestCase
  NAME_WITH_21_CHARS = 'xxx' * 21
  EMAIL_WITH_51_CHARS = 'xxx' * 244 + '@gmail.com'
  EMAIL_TEST_ADDRESSES = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
  MIXED_CASE_EMAIL = 'Foo@ExAMPle.CoM'

  def setup
    @user = User.new(name: 'topcbl', email: 'topcbl@gmail.com', password: "123123123",
                     password_confirmation: "123123123")
  end

  test "user which is created should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = NAME_WITH_21_CHARS
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = EMAIL_WITH_51_CHARS
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = EMAIL_TEST_ADDRESSES
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    @user.email = MIXED_CASE_EMAIL
    @user.save
    assert_equal MIXED_CASE_EMAIL.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "x" * 5
    assert_not @user.valid?
  end

end
