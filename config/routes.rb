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
    resources :anglers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :ordered_products, only: [:update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :seller do
    get 'top' => 'homes#top'
    resources :ordered_products, only: [:update]
    resources :orders, only: [:index, :show, :update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :public do
    get 'top' => 'homes#top'
    resources :delivery_destinations, only: [:new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :create, :show, :new]
    resources :product_in_carts, only: [:index, :create, :update, :destroy]
    resources :products, only: [:index, :show]
    resources :users, only: [:show, :edit, :update]
    post 'confirm' => 'orders#confirm'
    get 'thanks' => 'orders#thanks'
    get 'confirm' => 'profiles#confirm'
    patch 'withdrow' => 'profiles#withdrow'
    delete 'empty' => 'product_in_carts#empty'
  end
end
