Rails.application.routes.draw do
  # get 'translatioins/edit'
  # get 'translatioins/update'

  scope '(:locale)', locale: /en|zh-TW/ do
    resources :posts
  end
  resources :translations, only: [:index, :edit, :update]
  namespace :admin do
    resources :posts
  end
end
