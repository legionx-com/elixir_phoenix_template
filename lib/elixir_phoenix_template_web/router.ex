defmodule ElixirPhoenixTemplateWeb.Router do
  use ElixirPhoenixTemplateWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    # allow to be inside iframe
    # plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirPhoenixTemplateWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirPhoenixTemplateWeb do
  #   pipe_through :api
  # end
end
