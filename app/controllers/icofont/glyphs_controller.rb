require_dependency "icofont/application_controller"

module Icofont
  class GlyphsController < ApplicationController
    def index
    	render :json => Glyph.fetch
    end

    def update
    	Glyph.store params[:glyphs]
    	FontProcessor.new(params[:glyphs]).generate
    	render :json => { message: 'success' }
    end
  end
end
