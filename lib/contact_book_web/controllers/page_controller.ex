defmodule ContactBookWeb.PageController do
  use ContactBookWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
