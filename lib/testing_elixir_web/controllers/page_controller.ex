defmodule TestingElixirWeb.PageController do
  use TestingElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
