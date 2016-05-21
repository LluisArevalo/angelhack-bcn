Rails.application.routes.draw do

  devise_for :users
  
  get '/' => 'site#index'
  
  scope '/admin' do
    resources :actions
  end
end
