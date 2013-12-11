require_dependency "icofont/application_controller"
require_dependency "icofont/font_processor"

module Icofont
  class GlyphsController < ApplicationController
  	before_filter :set_glyph_path

    def index
    	render :json => Glyph.fetch
    end

    def update
    	Glyph.store params[:glyphs]
    	FontProcessor.new(params[:glyphs]).generate
    	render :json => { message: 'success' }
    end

    private

    def set_glyph_path
    	Glyph.set_data_path File.join(Rails.root, '.icofont', 'icofonts.txt')
    end
  end
end
