Rails.application.routes.draw do

  devise_for :users

  get '/' => 'site#index'
  
  scope '/admin' do
    resources :initiatives
  end

  get '/initiatives' => 'initiatives#users_index'
  post '/initiatives/:initiative_id/vote_priority' => 'priorities#create'
  post '/initiatives/:initiative_id/vote_status' => 'initiative_statuses#create'
end
