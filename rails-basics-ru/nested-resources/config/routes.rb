# frozen_string_literal: true

Rails.application.routes.draw do
  resources :post_comments
  root 'homes#index'

  # BEGIN
  resources :posts do
    resources :post_comments, only: [:index, :new, :create]
  end
  # END
end
