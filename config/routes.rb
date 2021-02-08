Rails.application.routes.draw do
  resources :constituencies
  resources :country_masters
  resources :town_masters
  resources :district_masters
  resources :district_type_masters
  resources :region_masters
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "region_masters#index"
  post 'region_district' => 'town_masters#region_district', as: :region_district
  post 'region_district_con' => 'constituencies#region_district_con', as: :region_district_con
end
