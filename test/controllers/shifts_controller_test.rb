require 'test_helper'

class ShiftsControllerTest < ActionController::TestCase


  admin = User.create(:first_name => "user", :last_name => "example", :email => "user@example.com", :password => "password", :password_confirmation => "password",:role => "admin", :confirmed_at => "2016-04-25 22:28:05")
  slc = User.create(:first_name => "user", :last_name => "example", :email => "user@example.com", :password => "password", :password_confirmation => "password",:role => "slc", :confirmed_at => "2016-04-25 22:28:05")
  create_shift = Shift.create(:date =>"2016-04-25", :start_time => "2016-04-25 09:57:00", :end_time => "2016-04-25 12:57:00", :department => "Floor 1", :break => "1pm-2pm")


test "admins can manage all shifts" do
  user = admin
  ability = Ability.new(user)
  user.save
  assert ability.can?(:manage, Shift.new)
  create_shift
  assert_response :success
end


test "slc cannot create a shift" do
  user = slc
  ability = Ability.new(user)
  user.save
  assert ability.cannot?(:create, Shift.new)
  create_shift
  assert_nil @shift, "shift is nil"
end


  test "only admin should visit new page" do
    user = admin
    ability = Ability.new(user)
    user.save
    assert ability.can?(:manage, Shift.new)
    get :new
    assert_response :success
  end


  test "should show shift" do
    get :show, id: @shift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shift
    assert_response :success
  end

  test "should destroy shift" do
    assert_difference('Shift.count', -1) do
      delete :destroy, id: @shift
    end
  end

test "should not save Shift without start_time" do
  shift = Shift.new
  assert_not shift.save
end

end