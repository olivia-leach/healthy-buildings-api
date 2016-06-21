Rails.application.routes.draw do
  resources :details, except: [:new, :edit]
  resources :days, except: [:new, :edit]
  resources :points, except: [:new, :edit]
  resources :data_points, except: [:new, :edit]
  resources :sensors, except: [:new, :edit]
  resources :measures, except: [:new, :edit]
  resources :frameworks, except: [:new, :edit]
  resources :baselines, except: [:new, :edit]
  resources :buildings, except: [:new, :edit]
  resources :profiles, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
