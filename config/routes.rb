Psychlopedia::Application.routes.draw do
  scope(path_names: {new: 'nueva'}) do
    resources :experiences, path: 'experiencias'
  end

  get 'search', to: 'experiences#search'

  get 'about', to: 'infrastructure#about', path: 'que'
  get 'style', to: 'infrastructure#style', path: 'estilo'
  get 'legal', to: 'infrastructure#legal', path: 'legal'
  get 'privacy', to: 'infrastructure#privacy', path: 'privacidad'

  get 'admin', to: 'god#index', path: 'admin'

  resource :session, only: [:new, :create, :destroy]

  root to: 'experiences#index'
end
