# Module to get a single issue from JIRA.
defmodule PlanningTool.JIRA.FetchIssue.HTTPoison do
  @behaviour PlanningTool.JIRA.FetchIssue

  def execute(key) do
    case get("/issue/#{key}") do
      { :ok, response } -> { :fetch_ok, (response |> Map.get(:body)) }
      { :error, reason } -> { :fetch_error, reason }
    end
  end

  use HTTPoison.Base # HTTPoison API-wrapping

  def process_url(path) do
    username = System.get_env("JIRA_USERNAME")
    password = System.get_env("JIRA_PASSWORD")
    domain = System.get_env("JIRA_DOMAIN")

    "https://" <> username <> ":" <> password <> "@" <> domain <> "/rest/api/2" <> path
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end
end
