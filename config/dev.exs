use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :planning_tool, PlanningTool.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

# Watch static and templates for browser reloading.
config :planning_tool, PlanningTool.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Test with In-Memory simulation
# config :planning_tool, :jira_search_issues, PlanningTool.JIRA.SearchIssues.InMemory
# config :planning_tool, :jira_fetch_issues, PlanningTool.JIRA.FetchIssues.InMemory
# config :planning_tool, :jira_update_issue, PlanningTool.JIRA.UpdateIssue.InMemory

# Real JIRA connection
config :planning_tool, :jira_search_issues, PlanningTool.JIRA.SearchIssues.HTTPoison
config :planning_tool, :jira_fetch_issues, PlanningTool.JIRA.FetchIssues.HTTPoison
config :planning_tool, :jira_fetch_issue, PlanningTool.JIRA.FetchIssue.HTTPoison
config :planning_tool, :jira_update_issue, PlanningTool.JIRA.UpdateIssue.HTTPoison

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
# config :planning_tool, PlanningTool.Repo,
#   adapter: Ecto.Adapters.Postgres,
#   username: "rchampourlier",
#   password: "",
#   database: "planning_tool_dev",
#   hostname: "localhost",
#   pool_size: 10
