require "test_helper"
require_relative '../../../lib/generators/icofont_generator'

class IcofontGeneratorTest < Rails::Generators::TestCase
	tests IcofontGenerator
  destination File.expand_path("../../../fixtures", __FILE__)

  setup do
    @routes_path ||= File.expand_path('config/routes.rb', destination_root)
    File.open(@routes_path, 'w') do |f|
      f << %Q(Rails.application.routes.draw do
end)
    end
  end

  test "the glyphs list file is created" do
  	glyphs_path = File.expand_path('glyphs.txt', destination_root)
  	Icofont::Paths.stubs(:glyphs_path).returns(glyphs_path)
  	run_icofont_generator
  	assert_file glyphs_path
  end

  test "injects mount engine to routes" do
  	run_icofont_generator
  	assert_file @routes_path, /mount_icofont/
  end

  def run_icofont_generator
  	run_generator %w(icofont)
  end
end