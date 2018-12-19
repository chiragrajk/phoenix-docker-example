defmodule WhaleWeb.PageController do
  use WhaleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
