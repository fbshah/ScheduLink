require 'rails_helper'
require 'spec_helper'



RSpec.describe "PasswordResets" do

it "emails user when requesting password reset" do
	user = create(:registered_user)
	visit new_user_session_path
	click_link "Forgot your password?"
	fill_in "Email", :with => user.email
	click_button "Send me reset password instructions"
	expect(current_path).to eq('/users/sign_in')
	expect(page).to have_content("You will receive an email with instructions on how to reset your password in a few minutes.")
	end

it "emails user when they don't recieve confirmation instructions" do
	user = create(:unregistered_user)
	visit new_user_session_path
	click_link "Didn't receive confirmation instructions?"
	fill_in "Email", :with => user.email
	click_button "Resend confirmation instructions"
	expect(current_path).to eq('/users/sign_in')
end

it "locks your account after 4 tries" do
	user = create(:registered_user)
	visit new_user_session_path
	fill_in "Email", :with => user.email
	fill_in "Password", :with => "falsepassword"
	click_button "Log in"
	fill_in "Password", :with => "falsepassword"
	click_button "Log in"
	fill_in "Password", :with => "falsepassword"
	click_button "Log in"
	expect(page).to have_content("You have one more attempt before your account is locked.")
	fill_in "Password", :with => "falsepassword"
	click_button "Log in"
	expect(page).to have_content("Your account is locked.")
end

end
