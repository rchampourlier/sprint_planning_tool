defmodule PlanningTool.Router do
  use PlanningTool.Web, :router

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

  scope "/", PlanningTool do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", PlanningTool do
    pipe_through :api

    # Can't use resources because we would have to implement
    # Http.put on Elm's side, which is a TODO.
    get "/issues", IssuesController, :index
    post "/issues/:id", IssuesController, :update
  end
end
