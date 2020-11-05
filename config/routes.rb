Rails.application.routes.draw do

  devise_for :admins, :controllers => {
 :registrations => 'admins/registrations',
 :sessions => 'admins/sessions'}

  devise_for :anglers, :controllers => {
 :registrations => 'anglers/registrations',
 :sessions => 'anglers/sessions'}

  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'user/homes#top'

  namespace :admin do
    get 'top' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :ordered_products, only: [:update]
  end

  namespace :angler do
    get 'top' => 'homes#top'
    resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :ordered_products, only: [:update]
  end

  namespace :user do
    get 'top' => 'homes#top'
    resources :products, only: [:index, :show]
    resources :product_in_carts, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:index, :create, :show, :new]
    resources :profiles, only: [:show, :edit, :update]
    resources :delivery_destinations, only: [:new, :create, :edit, :update, :destroy]
    post 'confirm' => 'orders#confirm'
    get 'thanks' => 'orders#thanks'
    get 'confirm' => 'profiles#confirm'
    patch 'withdrow' => 'profiles#withdrow'
    delete 'empty' => 'product_in_carts#empty'
  end
end
