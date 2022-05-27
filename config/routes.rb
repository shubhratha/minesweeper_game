Rails.application.routes.draw do
  root 'games#gridcreate'
  get 'users/show'
  get 'games/index'
  post 'games/create'
  post 'games/gridcreate'
  post 'tiles/sweeptile'
  post 'tiles/flagged_tile'
  resources :games do
    resources :mines, only: %i[ create, show, update, new]
  end
  #
  # resources :games  do
  #   resources :tiles, only: %i[index create show update destroy]
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
