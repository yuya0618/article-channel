Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    put :head_sort
    put :text_sort
    put :relation_sort
    resources :relations
    resources :heads
    resources :texts
  end

end
