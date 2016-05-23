Rails.application.routes.draw do

  namespace :api do
    scope :v1 do
      resource :bugs, only: [:create] do
        get '/count/:app_token', to: 'bugs#get_count', as: 'get_bugs_count'
        get '/:app_token/:bug_number', to: 'bugs#show', as: 'get_bug'
      end
    end

  end

  get '*path', to: 'errors#not_found'
  post '*path', to: 'errors#not_found'

end
