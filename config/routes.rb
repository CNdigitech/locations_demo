Rails.application.routes.draw do
  resources :election_event_locations
  resources :election_event_masters
  resources :polling_station_agents
  resources :polling_station_masters
  resources :political_party_masters do
    member do
      delete :delete_image_attachment
    end
  end
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
  post 'region_constituency_ps' => 'polling_station_masters#region_constituency_ps', as: :region_constituency_ps
  post 'region_constituency_pa' => 'polling_station_agents#region_constituency_pa', as: :region_constituency_pa
  # ===============================================================================================

  # post 'event_region_data' => 'election_event_masters#event_region_data', as: :event_region_data
  get 'event_region_modal' => 'election_event_masters#event_region_modal', as: :event_region_modal
  get 'event_constituency_modal' => 'election_event_masters#event_constituency_modal', as: :event_constituency_modal
  get 'event_poll_station_modal' => 'election_event_masters#event_poll_station_modal', as: :event_poll_station_modal

  post 'constituency_bulk_upload' => 'constituencies#constituency_bulk_upload', as: :constituency_bulk_upload
  get 'constituency_upload_form' => 'constituencies#constituency_upload_form', as: :constituency_upload_form 
  get 'constituency_sample_csv' => 'constituencies#constituency_sample_csv', as: :constituency_sample_csv

  post 'district_bulk_upload' => 'district_masters#district_bulk_upload', as: :district_bulk_upload
  get 'district_upload_form' => 'district_masters#district_upload_form', as: :district_upload_form 
  get 'district_sample_csv' => 'district_masters#district_sample_csv', as: :district_sample_csv

  post 'station_bulk_upload' => 'polling_station_masters#station_bulk_upload', as: :station_bulk_upload
  get 'station_upload_form' => 'polling_station_masters#station_upload_form', as: :station_upload_form 
  get 'station_sample_csv' => 'polling_station_masters#station_sample_csv', as: :station_sample_csv

  post 'agent_bulk_upload' => 'polling_station_agents#agent_bulk_upload', as: :agent_bulk_upload
  get 'agent_upload_form' => 'polling_station_agents#agent_upload_form', as: :agent_upload_form 
  get 'agent_sample_csv' => 'polling_station_agents#agent_sample_csv', as: :agent_sample_csv

  get 'disable_agent' => 'polling_station_agents#disable_agent', as: :disable_agent
  get 'disable_party' => 'political_party_masters#disable_party', as: :disable_party
  get 'disable_station' => 'polling_station_masters#disable_station', as: :disable_station

end
