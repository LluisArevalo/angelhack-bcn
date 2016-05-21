Rails.application.routes.draw do

  devise_for :users

  get '/' => 'site#index'
  get '/actions' => 'actions#users_index'
end
