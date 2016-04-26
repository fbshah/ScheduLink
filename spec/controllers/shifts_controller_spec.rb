require 'rails_helper'
require 'spec_helper'
require "cancan/matchers"



RSpec.describe ShiftsController do

before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin_user]
    sign_in FactoryGirl.create(:admin_user)
    @user = FactoryGirl.create(:cancan_user)
    @shift = FactoryGirl.create(:shift)
  end
	render_views

  	it 'GET index' do
		  get :index
		  assert_template :index 
    end

  	it 'GET new' do
		  get :new, id: @shift
		  assert_response :success 
    end

    it "should delete shift as admin" do
      expect{ 
        delete :destroy, id: @shift, :shift => {:start_time => @shift.start_time}
        }.to change(Shift, :count).by(-1)
    end
  

end
