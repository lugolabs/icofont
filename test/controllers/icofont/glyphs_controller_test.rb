require 'test_helper'

module Icofont
  class GlyphsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index, :use_route => 'icofont'
      assert_response :success
    end

    test "should post update" do
      post :update, :use_route => 'icofont'
      assert_response :success
    end
  end
end
