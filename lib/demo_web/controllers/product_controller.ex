defmodule DemoWeb.ProductController do
  use DemoWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end
end
