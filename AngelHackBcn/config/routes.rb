Rails.application.routes.draw do

  devise_for :users

  get '/' => 'site#index'
  
  scope '/admin' do
    resources :initiatives, except: :show
  end

  get '/initiatives' => 'initiatives#users_index'
  get '/initiatives/:id' => 'initiatives#show'
  post '/initiatives/:id/vote_priority' => 'priorities#create'
  post '/initiatives/:id/vote_status' => 'initiative_statuses#create'
end
