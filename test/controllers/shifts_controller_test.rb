require 'test_helper'

class ShiftsControllerTest < ActionController::TestCase
  setup do
    @shift = shifts(:one)
  end

test "user can only destroy projects which he owns" do
  user = User.create(first_name: "Example", last_name: "user", email: "user@example.com", password: "foobar", password_confirmation: "foobar", role: "admin", encrypted_password: '2a$10$mgUljKXcqZ20uGpYNu1yLuiA9AiCiO.OKiWaVoVG9CG')
  ability = Ability.new(user)
  assert ability.can?(:destroy, Shift.new(:user => user))
  assert ability.cannot?(:destroy, Shift.new)
end

  test "should get index" do
    user = User.create!(:email => "user@example.com", :password => "password", :password_confirmation => "password",:role => "admin") # I recommend a factory for this
    session[:user_id] = user.id # log in user however you like, alternatively stub `current_user` method
    get :index
    assert_template :index # render the template since they should have access
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end