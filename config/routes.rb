Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "articles#index" # root path depend on what controller you decide to map to this path
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show" # pass an id down from the url as param to the articles controller

  # This is called resourceful routing. By doing this, rails will automatically create a list of CRUD routes and tells you what controller method you should create for the route
  # in terminal run [rails routes] to see all the created routes and pre-named controller methods
  resources :articles do
    resources :comments
  end



  # Side note to self
    # get "/articles", to: "articles#index"
      # get -> get request
      # "/articles" -> route in the url
      # to: -> mapping to a particular file
      # "articles#index" -> index is both the [name] of the method inside the [controller] AND the [name] of the [view file]
end
