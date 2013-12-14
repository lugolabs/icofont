require_dependency "icofont/application_controller"

module Icofont
  class GlyphsController < ApplicationController
    def index
      render :json => Glyph.fetch
    end

    def update
      message = 'error'
      if params[:glyphs]
      	Glyph.store params[:glyphs]
      	FontProcessor.new(params[:glyphs]).generate
        message = 'success'
      end
    	render :json => { message: message }
    end
  end
end
