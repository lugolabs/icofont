require 'test_helper'

module Icofont
  class GlyphsControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
