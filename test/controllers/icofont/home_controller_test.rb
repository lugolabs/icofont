require 'test_helper'

module Icofont
  class HomeControllerTest < ActionController::TestCase
    test "should get index" do
      get :index, :use_route => 'icofont'
      assert_response :success
    end
  end
end
