require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save without name" do
    user = User.new
    assert_not user.save, "Saved a User without a name"
  end
  test "should not save if name not unique" do
      user = User.new(name: "Ash")
      assert_not user.save, "Saved a User with non-unique title"
  end
end
