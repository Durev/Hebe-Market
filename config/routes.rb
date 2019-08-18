# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
end
