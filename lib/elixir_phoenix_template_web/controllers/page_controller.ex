defmodule ElixirPhoenixTemplateWeb.PageController do
  use ElixirPhoenixTemplateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
