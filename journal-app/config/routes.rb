Rails.application.routes.draw do
  # Root path
  root "entries#index"

  # Entry resource routes
  resources :entries, only: [ :index, :create, :new, :destroy, :show, :edit, :update ]

  resources :entries do
    post :share, on: :member
  end


  # Devise routes for user authentication
  devise_for :users
  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  get "/calendar", to: "calendars#show"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up", to: "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end
