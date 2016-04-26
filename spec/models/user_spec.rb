require 'rails_helper'
require 'spec_helper'

RSpec.describe "UserSpec" do
 

it "validates blank first_name and last_name fields on sign up" do
	visit new_user_registration_path
	fill_in "First name", :with => " "
	fill_in "Last name", :with => " "
	click_button "Sign up"
	expect(page).to have_content("first name can't be blank")
	expect(page).to have_content("last name can't be blank")
end

it "validates blank email and password fields on sign up" do
	visit new_user_registration_path
	fill_in "Email", :with => " "
	fill_in "Password", :with => " "
	click_button "Sign up"
	expect(page).to have_content("Email can't be blank")
	expect(page).to have_content("8 characters minimum")
end

it "checks minimum length of password" do
	visit new_user_registration_path
	fill_in "Password", :with => "1234567"
	click_button "Sign up"
	expect(page).to have_content("Password is too short (minimum is 8 characters)")
end


it "checks maximum length of password" do
	visit new_user_registration_path
	fill_in "Password", :with => "12345678910123456"
	click_button "Sign up"
	expect(page).to have_content("Password is too long (maximum is 15 characters)")
end

it "validates email format just incase devise does not" do
	visit new_user_registration_path
	fill_in "Password", :with => "password"
	click_button "Sign up"
	expect(page).to have_content("Email please type email with an @ sign")
end

it "validates when name is too short" do
	visit new_user_registration_path
	fill_in "First name", :with => "f"
	click_button "Sign up"
	expect(page).to have_content("First name too short")
end

it "validates when name is too long" do
	visit new_user_registration_path
	fill_in "First name", :with => "thisnameismorethantwentycharecters"
	click_button "Sign up"
	expect(page).to have_content("First name too long")
end
end
