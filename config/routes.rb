Rails.application.routes.draw do
  resources :election_event_locations
  resources :election_event_masters
  resources :polling_station_agents
  resources :polling_station_masters
  resources :political_party_masters
  resources :constituencies
  resources :country_masters
  resources :town_masters
  resources :district_masters
  resources :district_type_masters
  resources :region_masters
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "region_masters#index"

  # cascading dropdown route
  post 'region_district' => 'town_masters#region_district', as: :region_district
  post 'region_district_con' => 'constituencies#region_district_con', as: :region_district_con
  post 'region_district_pp' => 'political_party_masters#region_district_pp', as: :region_district_pp
  post 'district_town_pp' => 'political_party_masters#district_town_pp', as: :district_town_pp
  post 'event_region_data' => 'election_event_masters#event_region_data', as: :event_region_data
  post 'region_constituency_ps' => 'polling_station_masters#region_constituency_ps', as: :region_constituency_ps
  post 'region_constituency_pa' => 'polling_station_agents#region_constituency_pa', as: :region_constituency_pa
  # ===============================================================================================

  get 'event_region_modal' => 'election_event_masters#event_region_modal', as: :event_region_modal
  get 'event_district_modal' => 'election_event_masters#event_district_modal', as: :event_district_modal
  get 'event_constituency_modal' => 'election_event_masters#event_constituency_modal', as: :event_constituency_modal

end
