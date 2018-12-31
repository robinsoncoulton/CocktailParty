# frozen_string_literal: true
require 'devise_token_auth'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :cocktails
end
