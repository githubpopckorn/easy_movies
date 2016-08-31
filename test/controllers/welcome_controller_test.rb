require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Devise::Test::ControllerHelpers
    
  test "should get index" do
    get :index
    asser_response :success
  end
    
    
end
