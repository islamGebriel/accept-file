Rails.application.routes.draw do
  get 'files/new', to: 'files#new'
  get 'files', to: 'files#index'
  post 'files', to: 'files#create'
  root 'files'
end
