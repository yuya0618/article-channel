Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    put :sort
    resources :relations
    resources :heads
    resources :texts
  end

end
