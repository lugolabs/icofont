require_dependency "icofont/application_controller"

module Icofont
  class GlyphsController < ApplicationController
    def index
      render :json => Glyph.fetch
    end

    def update
      glyphs = params[:glyphs] || []
      Glyph.store glyphs
      FontProcessor.new(glyphs).generate
      render :json => { message: 'success' }
    end
  end
end
