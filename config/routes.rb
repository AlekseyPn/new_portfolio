# frozen_string_literal: true

Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs, except: [:show]
  get 'blog/:id', to: 'blogs#show', as: 'blog_show'

  root to: 'pages#home'
end
