Rails.application.routes.draw do

  devise_for :users

  get '/' => 'site#index'
  
  scope '/admin' do
    resources :initiatives
  end

  get '/initiatives' => 'initiatives#users_index'
end
