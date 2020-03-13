defmodule ElixirPhoenixTemplate.Repo do
  use Ecto.Repo,
    otp_app: :elixir_phoenix_template,
    adapter: Ecto.Adapters.Postgres
end
