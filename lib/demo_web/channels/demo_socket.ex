defmodule DemoWeb.DemoSocket do
  use Phoenix.Socket

  channel "room:*", DemoWeb.DemoChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(socket), do: nil
end
