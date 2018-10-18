# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs, except: [:show] do
    member do
      get :toggle_status
    end
  end
  get 'blog/:id', to: 'blogs#show', as: 'blog_show'

  root to: 'pages#home'
end
