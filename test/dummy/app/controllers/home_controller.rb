class HomeController < ApplicationController
  def index
    	@icons = Icofont::Glyph.fetch
  end
end
