Icofont::Engine.routes.draw do
  get 'glyphs' => 'glyphs#index'
  post 'glyphs/update' => 'glyphs#update'

  root :to => 'home#index'
end
