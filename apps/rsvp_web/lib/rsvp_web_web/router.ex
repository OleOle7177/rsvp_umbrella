defmodule RsvpWebWeb.Router do
  use RsvpWebWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RsvpWebWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/events", EventController, :list
    # Порядок важен - /new должно быть перед :id
    get "/events/new", EventController, :create
    post "/events/new", EventController, :add
    get "/events/:id", EventController, :show

    get "/login", LoginController, :index
    post "/login", LoginController, :login
  end

  # Other scopes may use custom stacks.
  # scope "/api", RsvpWebWeb do
  #   pipe_through :api
  # end

  # to check route helpers:
  # RsvpWebWeb.Router.Helpers.event_path(RsvpWebWeb.Endpoint, :list)
  # RsvpWebWeb.Router.Helpers.event_path(RsvpWebWeb.Endpoint, :show, 1)
end
