defmodule MseWeb.Web.Router do
  use MseWeb.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin_basic_auth do
    plug BasicAuth, use_config: {:mse_web, :admin_basic_auth}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/graphql", Absinthe.Plug, schema: Graph.Schema

  scope "/admin", as: :admin do
    pipe_through [:browser, :admin_basic_auth]

    scope "/imports", as: :imports do
      resources "/sets", MseWeb.Web.Admin.Imports.SetController, only: [:update], singleton: true
      resources "/cards", MseWeb.Web.Admin.Imports.CardController, only: [:update], singleton: true
    end
  end

  scope "/admin", ExAdmin do
    pipe_through [:browser, :admin_basic_auth]

    admin_routes()
  end

  scope "/", MseWeb.Web do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end
end
