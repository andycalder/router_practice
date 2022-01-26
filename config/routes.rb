Rails.application.routes.draw do
  resource :user
  resources :companies
  resources :managers
  resources :employees do
    resources :evaluations do
      resources :scores
    end
  end

  get '/bosses', to: redirect('/managers')
  get '/bosses/:id', to: redirect('/managers/:id')
  get '/directory', to: 'employees#index', as: 'directory'
  get '/search(/:group(/:name))', to: 'searches#new', as: 'search'
  root to: 'managers#index'
end
