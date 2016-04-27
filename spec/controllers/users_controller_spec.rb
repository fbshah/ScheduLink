require 'rails_helper'
require 'spec_helper'
require "cancan/matchers"



RSpec.describe UsersController do

before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin_user]
    sign_in FactoryGirl.create(:admin_user)
    @user = FactoryGirl.create(:cancan_user)
  end
	render_views

  	it 'GET index as admin' do
		get :index
		assert_template :index # render the template since they should have access
    end

  	it 'GET new as admin' do
		get :new, id: @user
		assert_response :success # render the template since they should have access
    end

     it 'GET edit as admin' do
		get :new, id: @user
		assert_response :success # render the template since they should have access
    end

  	it "should delete user as admin" do
  		expect{ 
      	delete :destroy, id: @user, :user => {:password => @user.password}
      	}.to change(User, :count).by(-1)
    end
 	
 	it "should update user as admin" do
  		expect{ 
      	delete :destroy, id: @user, :user => {:password => @user.password}
      	}.to change(User, :count).by(-1)
    end
end
