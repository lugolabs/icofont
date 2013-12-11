require_dependency "icofont/application_controller"

module Icofont
  class GlyphsController < ApplicationController
    def index
    	Glyph.set_data_path File.join(Rails.root, '.icofont', 'icofonts.txt')
    	render :json => Glyph.fetch
    end

    def update
    	render :text => params[:glyphs]
    end
  end
end
